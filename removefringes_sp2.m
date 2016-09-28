% removefringes_sp2.m
% Removes fringes using the method in Caspar F. Ockeloen's masters thesis
% from Amsterdam. See section 2.2 of the thesis.
% The idea is to find a linear superposition of background probe shots for
% each shot with atoms in it to make the "best" background image to
% subtract from the atoms.


load configdata
load maindata


%% Select ROI for mask

A_processed = handles.A_sp2;
O = handles.O;

% Draw box with mouse
t = waitforbuttonpress;    % wait for mouse button to be pressed

point1 = get(gca,'CurrentPoint');    % button down detected
finalRect = rbbox;                   % return figure units
point2 = get(gca,'CurrentPoint');    % button up detected
point1 = round(point1(1,1:2));              % extract x and y
point2 = round(point2(1,1:2));
p1 = min(point1,point2);    % Do this so thing works no matter which way box is dragged
p2 = max(point1,point2);

% If you want to use a fixed ROI every time, you can define your own p1 and
% p2 points here.

% Background mask
bgmask = ones(size(A_processed));
bgmask(p1(2):p2(2),p1(1):p2(1)) = 0;


%% Reload images files for re-processing

if handles.olddata == 0
    
    currentDate = date;
    currentYear = num2str(year(date));
    [monthNum currentMonth] = month(date);
    monthFullName = datestr(date,'mmmm');
    currentDay = num2str(day(date),'%02d');
    currentPath = [storagePath filesep currentYear filesep currentMonth filesep currentDay filesep];
    
else
    
    currentPath = pathname_olddata;    
    
end

A = load([currentPath astorename_sp2]);
C = load([currentPath cstorename_sp2]);

if useROI_sp2 == 1 
    A = A(ax_sp2(3):ax_sp2(4),ax_sp2(1):ax_sp2(2));
    C = C(ax_sp2(3):ax_sp2(4),ax_sp2(1):ax_sp2(2));
    bgmask = bgmask(ax_sp2(3):ax_sp2(4),ax_sp2(1):ax_sp2(2));
end


%% Collect backround images

underscoreIndex = find(frName_sp2 == '_');
filename_chopped = frName_sp2(1:underscoreIndex(2));

% Loop through reference images and store them in a matrix
for ii = 1:1:length(refindex_sp2);
 
    filename_ref = [filename_chopped num2str(refindex_sp2(ii)) '.asc'];
    refimg = load([frPath_sp2 filename_ref]);
    
    if useROI_sp2 == 1
        refimg = refimg(ax_sp2(3):ax_sp2(4),ax_sp2(1):ax_sp2(2));
    end
    
    refimg_matrix(:,:,ii) = refimg;
  
end

num_images = length(refindex_sp2);  % number of reference images
xdim = size(A,2);
ydim = size(A,1);

ref_reshaped = double(reshape(refimg_matrix,xdim*ydim,num_images));
A_reshaped = double(reshape(A,xdim*ydim,1));

optrefimages = zeros(size(A));

% load([FRmask_pathname_sp2 FRmask_filename_sp2]);    % presumably the mask is saved as "bgmask" in the .mat file

mask_index = find(bgmask(:) == 1);

% Decompose B = ref_reshaped*ref_reshaped' using singular value or LU decomposition
[LL,UU,PP] = lu(ref_reshaped(mask_index,:)'*ref_reshaped(mask_index,:),'vector');       % LU decomposition

bb = ref_reshaped(mask_index,:)'*A_reshaped(mask_index,1);
lower.LT = true;
upper.UT = true;
cc = linsolve(UU,linsolve(LL,bb(PP,:),lower),upper);

% Compute optimised reference image
B_defringed(:,:,1) = reshape(ref_reshaped*cc,[ydim xdim]);
B = B_defringed;

ana_sp2;