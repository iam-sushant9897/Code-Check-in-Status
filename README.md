**Code Check-in Status Script**
This script allows you to automate the process of checking the commit status of repositories within a GitHub organization for a specific date and time range. It clones the repositories, checks each branch for commits within the given date range, and saves the commit logs to a specified directory.

**Prerequisites**
**Git:** Make sure Git is installed on your system.
**GitHub Personal Access Token:** You need a personal access token with access to the repositories in your organization.

**How to Use**
**1.Update Configuration:**

    Set your GitHub organization name by replacing ORGANIZATION="XYZ" with your actual organization name.
    Replace **TOKEN="XYZ"** with your GitHub personal access token.
    Add the names of the repositories you want to check in the REPOSITORIES array.
    
**2.Clone Repositories:**

    The script clones each repository listed in the REPOSITORIES array to a temporary directory specified by WORKDIR.
    By default, the working directory is set to /tmp/commit_log_Organization_Name. You can change this to another directory 
    if needed.

**3.Check Commits:**

    The script checks each branch of the repository for commits made between the specified --since and --until dates (e.g., 
    "2024-08-30 00:00" to "2024-09-01 00:00").
     It saves the commit history in a text file named <repository>_<branch>_commits.txt in the working directory.

**4.Output:**

   If there are no commits in a branch during the specified date range, the corresponding commit log file will be removed.
   
**5.Clean Up:**

After processing, the cloned repositories are removed to save space.

**Example**
Here is an example configuration:

**ORGANIZATION**="YourOrgName"
**TOKEN**="your_personal_access_token"
**REPOSITORIES**=("Repo-1" "Repo-2" "Repo-3")

Replace **"YourOrgName"** with your organization name and **"your_personal_access_token"** with your GitHub token. Add your repository names to the REPOSITORIES array.

**Running the Script**

  Make sure the script is executable
   **chmod +x script_name.sh**

  Run the script
  ** ./script_name.sh**

**Notes:**
  Ensure that your GitHub token has the necessary permissions to access the repositories.
  The date range used in the script should be adjusted according to your needs.
  
**License**
This script is provided "as-is" without any warranties. Use at your own risk.



