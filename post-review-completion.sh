#!bash

_post_review()
{
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	longopts="
		--branch
		--bugs-closed
		--change-only
		--debug
		--description
		--description-file
		--diff-filename
		--diff-filename
		--diff-only
		--guess-description
		--guess-summary
		--help
		--label
		--open
		--output-diff
		--p4-client
		--p4-passwd
		--p4-port
		--parent
		--password
		--publish
		--reopen
		--repository-url
		--review-request-id
		--revision-range
		--server
		--submit-as
		--summary
		--target-groups
		--target-people
		--testing-done
		--testing-done-file
		--tracking-branch
		--username
		--version
		"

	if [[ ${cur} == -* ]] ; then
		COMPREPLY=( $(compgen -W "${longopts}" -- ${cur}) )
		return 0
	fi
}

complete -F _post_review post-review


# Usage: post-review [-pond] [-r review_id] [changenum]
# 
# Options:
#   --version             show program's version number and exit
#   -h, --help            show this help message and exit
#   -p, --publish         publish the review request immediately after
#                         submitting
#   -r ID, --review-request-id=ID
#                         existing review request ID to update
#   -o, --open            open a web browser to the review request page
#   -n, --output-diff     outputs a diff to the console and exits. Does not post
#   --server=SERVER       specify a different Review Board server to use
#   --diff-only           uploads a new diff, but does not update info from
#                         changelist
#   --reopen              reopen discarded review request after update
#   --target-groups=TARGET_GROUPS
#                         names of the groups who will perform the review
#   --target-people=TARGET_PEOPLE
#                         names of the people who will perform the review
#   --summary=SUMMARY     summary of the review
#   --description=DESCRIPTION
#                         description of the review
#   --description-file=DESCRIPTION_FILE
#                         text file containing a description of the review
#   --guess-summary       guess summary from the latest commit
#                         (git/hg/hgsubversion only)
#   --guess-description   guess description based on commits on this branch
#                         (git/hg/hgsubversion only)
#   --testing-done=TESTING_DONE
#                         details of testing done
#   --testing-done-file=TESTING_FILE
#                         text file containing details of testing done
#   --branch=BRANCH       affected branch
#   --bugs-closed=BUGS_CLOSED
#                         list of bugs closed
#   --revision-range=REVISION_RANGE
#                         generate the diff for review based on given revision
#                         range
#   --label=LABEL         label (ClearCase Only)
#   --submit-as=USERNAME  user name to be recorded as the author of the review
#                         request, instead of the logged in user
#   --username=USERNAME   user name to be supplied to the reviewboard server
#   --password=PASSWORD   password to be supplied to the reviewboard server
#   --change-only         updates info from changelist, but does not upload a
#                         new diff (only available if your repository supports
#                         changesets)
#   --parent=PARENT_BRANCH
#                         the parent branch this diff should be against (only
#                         available if your repository supports parent diffs)
#   --tracking-branch=TRACKING
#                         Tracking branch from which your branch is derived (git
#                         only, defaults to origin/master)
#   --p4-client=P4_CLIENT
#                         the Perforce client name that the review is in
#   --p4-port=P4_PORT     the Perforce servers IP address that the review is on
#   --p4-passwd=P4_PASSWD
#                         the Perforce password or ticket of the user in the
#                         P4USER environment variable
#   --repository-url=REPOSITORY_URL
#                         the url for a repository for creating a diff outside
#                         of a working copy (currently only supported by
#                         Subversion with --revision-range or --diff-filename
#                         and ClearCase with relative paths outside the view)
#   -d, --debug           display debug output
#   --diff-filename=DIFF_FILENAME
#                         upload an existing diff file, instead of generating a
#                         new diff
# 
