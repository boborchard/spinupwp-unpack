# SpinupWP Unpack Script

Unpack a WordPress backup and load into a SpinupWP Site

> This script assumes that you are uploading a zip file that contains just the /wp-content folder and a .sql file for the database. It does not care about the name of the files, just that they exist.

To use this script:

1. Upload your .zip backup as well as this script to `/` (above `/files`) for the site you're going to unpack.
2. SSH into your site and run `sh unpack.sh`
3. Follow the given prompts - the script will clean itself up when it completes.
4. Clear the page cache in SpinupWP's dashboard for the site

That's it!
