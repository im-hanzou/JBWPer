# JBWPer | CVE-2022-4061 - JobBoardWP
Automatic Mass Tool for check and exploiting vulnerability in CVE-2022-4061 - JobBoardWP < 1.2.2 - Unauthenticated Arbitrary File Upload<br><br>
<img src="https://github.com/im-hanzou/JBWPer/blob/main/detail/jbwper.png" width=600></img><br>
- Using GNU Parallel. You must have parallel for run this tool.<br>
- <b>If you found error like "$'\r': command not found" just do "dos2unix jbwper.sh"</b>
# Install Parallel
- Linux : <code>apt-get install parallel -y</code><br>
- Windows : You can install WSL (windows subsystem linux) then do install like linux<br>if you want use windows (no wsl), install <a href="https://git-scm.com/download/win">GitBash</a> then do this command for install parallel: <br>
[#] <code>curl pi.dk/3/ > install.sh </code><br>[#] <code>sha1sum install.sh | grep 12345678 </code><br>[#] <code>md5sum install.sh </code><br>[#] <code>sha512sum install.sh </code><br>[#] <code>bash install.sh</code><br>
# How To Use
- <b>Make sure you already install Parallel!</b> Then do:
- [#] <code>git clone https://github.com/im-hanzou/JBWPer.git</code>
- [#] <code>cd JBWPer && chmod +x jbwper.sh</code>
- [#] <code>./jbwper.sh yourlist.txt thread</code>
# Reference
- https://nvd.nist.gov/vuln/detail/CVE-2022-4061
- https://wpscan.com/vulnerability/fec68e6e-f612-43c8-8301-80f7ae3be665
- https://github.com/advisories/GHSA-3459-2j34-8x8g
