REM Block Create Branch at Root
ECHO Arguments:
ECHO ProjectName - the name of the VSTS Team Project
ECHO Collection - the root URI for the project collection
ECHO Repository - the repository to set the permissions on

tf git permission /deny:CreateBranch /group:[%1]\Contributors /collection:%2 /teamproject:%1 /repository:%3

REM allow feature branches
tf git permission /allow:CreateBranch /group:[%1]\Contributors /collection:%2 /teamproject:%1 /repository:%3 /branch:feature

REM allow admins and release admins to create release branches
tf git permission /allow:CreateBranch /group:"[%1]\Project Administrators" /collection:%2 /teamproject:%1 /repository:%3 /branch:release
tf git permission /allow:CreateBranch /group:"[%1]\Build Administrators" /collection:%2 /teamproject:%1 /repository:%3 /branch:release

REM allow admins to recreate master
tf git permission /allow:CreateBranch /group:"[%1]\Project Administrators" /collection:%2 /teamproject:%1 /repository:%3 /branch:master

REM allow contributors to delete feature branches
REM allow feature branches
tf git permission /allow:ForcePush /group:[%1]\Contributors /collection:%2 /teamproject:%1 /repository:%3 /branch:feature
