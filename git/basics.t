Use git init to create an empty repository
  $ git init --initial-branch main 2>1 >/dev/null
  $ git config user.email "test@example.com"
  $ git config user.name "Test Runner"
  $ git status
  On branch main
  
  No commits yet
  
  Untracked files:
    (use "git add <file>..." to include in what will be committed)
  \t1 (esc)
  
  nothing added to commit but untracked files present (use "git add" to track)
  $ echo "A" > a.txt
  $ git add a.txt
  $ git commit --message "Created a.txt" 2>1 >/dev/null
  $ echo "Update to A" > a.txt
add + commit can be done directly at commit by specifying the file directly
  $ git commit --message "Modified a.txt" a.txt 2>1 >/dev/null
  $ git log --format="|-- '%s'"
  |-- 'Modified a.txt'
  |-- 'Created a.txt'
