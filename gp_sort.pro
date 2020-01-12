pro gp_sort,ID,path=path,fixbb=fixbb

fixbb=keyword_set(fixbb)
if not keyword_set(path) then path='./data/output/'
file_mkdir,path+ID
command='mv '+path+'*.eps '+path+ID
spawn,command
print,'ALL .eps files were moved to:'
print,path+ID

if fixbb then begin
files=path+ID+"/*.eps"
print,'Fixing bounding box for files: '
print,files
command="perl -pi -e 's/$IDL_DICT begin 0 738/$IDL_DICT begin 0 684/g' "+files
spawn,command
print,'done.'
endif

end
