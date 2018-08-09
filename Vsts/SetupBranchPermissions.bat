REM Block Create Branch at Root
tf git permission /deny:CreateBranch /group:[%1]\Contributors /collection:%2 /teamproject:%1 /repository:%3

REM allow feature branches
tf git permission /allow:CreateBranch /group:[%1]\Contributors /collection:%2 /teamproject:%1 /repository:%3 /branch:feature

REM allow admins and release admins to create release branches
tf git permission /allow:CreateBranch /group:"[%1]\Project Administrators" /collection:%2 /teamproject:%1 /repository:%3 /branch:release
tf git permission /allow:CreateBranch /group:"[%1]\Build Administrators" /collection:%2 /teamproject:%1 /repository:%3 /branch:release

REM allow admins to recreate master
tf git permission /allow:CreateBranch /group:"[%1]\Project Administrators" /collection:%2 /teamproject:%1 /repository:%3 /branch:master