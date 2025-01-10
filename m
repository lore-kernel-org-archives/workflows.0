Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B42063C7;
	Fri, 10 Jan 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511676; cv=none; b=lXQLoe7obAwdkHLm8IGBf5fBzRG2FuGay1rVlvKZZgefkoRZBj+Ycvzb66tgabWh3ZXjP2LvW69ANb9acGj4+lSL5oWoUkoJSgmEjTRNihZfwSzSFF+F+9p/dTNtbpDRbTrErofC9vU+CFTSCsOEjFxx+FkPfV1Mi45Ln7j27RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511676; c=relaxed/simple;
	bh=YIt07cdTZ+/lsSWeEviWIYluwoLNvS5FzDICoI8N/Dg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8XoKyeJU64HwnHyfzfpMYbuVa1AGz9qkDxHqZ/SxUiJcsvp2GXvRWazjKU5UG9KMYOiOxaJxOoWFIEKEkWrtO70BjigxoH7xkLFyogSYzbMvq5Xfxx5gjs7uV1O0NSvtWxpfg7pMsqgLUfLMjbqMucFwuduCWBxkUV4eYNuQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Ar+oe1D5; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Ar+oe1D5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1736511664; bh=6fdN0gKKRNNJOG4fOocIyM3P49OZ4LlaNAvBNEw+wXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ar+oe1D59VaqYXTZAbfubbMAB2h/tRUjkERzU58QgQfgCH/9LkMWf//McRMn8bWLd
	 VTcg6eM3rSLnxHt8WGubz5Bq8MVQCu83ttSixVJIMCjcLZ+M1NYvQxjjQXG/W0k/Bp
	 NJ7r9cj95VUixgJP3kwfC/sz7DrJ5RG00RkfZKfs=
Received: from mail.red54.com ([185.220.101.102])
	by newxmesmtplogicsvrszgpua8-0.qq.com (NewEsmtp) with SMTP
	id 52F87847; Fri, 10 Jan 2025 20:20:47 +0800
X-QQ-mid: xmsmtpt1736511647tju0h5rg1
Message-ID: <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
X-QQ-XMAILINFO: MyirvGjpKb1jifP4Fsi15Ro29ATGj9Tz3AK6VNYjQX4QXwr8JWIgr3tWD9plMi
	 l4LhqFHbtL2hIufyZH85ipnqXqFm/r6qnYDtyVjcvbv5XcQ3Mjy21+fhqR6f/lz4TCpl9R7ydQxh
	 Nb2VksbDVqsX6SlHnMF+Ef52+SmYJgMsEewCqa/49pYNY2ABeimmhtjyOL5J1eqLT3hXrGnGxUAb
	 NmLl3goHm5fsUotLw+UtDeCbBoHe2z22YFR92NWXIHRBBr9ZWwSTRhGh6QCXb4DRsL+Fohz5Q39R
	 DrfBKH7SN3WJqYdu/pgL3/6jXr6ChUATBcv9aYRPXPAZThuUwEv+SolLC/tiXNvQMUlyx//JKQzL
	 +SSLtrOXZDnDl0gVONPneBf9v0zKC2f/EcwmvZf5PGMAvUp1zX4bjkHi3dE7oGjUAYi82lBnmhJv
	 NBggAU73itCdDuG1/wp8/mrGpPj7AbzUIK5BbDgFYQbPvVZHGgtU7UeCHtJVuvbXq2MEMAIOi3Cn
	 sLyH9Ae+z0ir3Gs6h7PL/a3RE2O8In28Vzn10SsQu9x0ynS9QV8LXBolKbwrZYRqcEy39uGy1Yx3
	 Cn38ZLmuW3ESXlGMtIk+sfLpoFEpJ6JjOn8fmcLINGz8w9tRC68XS6i/Fow4CSoIyssijzpLbQaf
	 QhUoYN5CKP/abUi41NV1yQ7VhOIDovDmLDh8VB96VVShtGbJooVG5Poc6ftpoZdn7Z8/p1I79D24
	 c5lO/+w8GcZ5eJ5+ZUEqI2zof7uW1DWvl6F1oQkvi18O5Yz8/VRrrppr8x50RJI0PiDGNC7mo8BI
	 pWCyBL6q//WY0Uc3ZM0sFPwsPDlS4omZ10eu+KjZ2VIV55kP8lnae36ST0D0lPgaiTcvHi59XB6V
	 ls4AecJF1EajfzMZWSUQDE0rSolbjCP3BtG4DzR5o+Wo+A+8Ln9fPoedUfhH8mCrNLxFySGEj8NO
	 R5t8J0PRdOAdenD2iQanVEc+FrHFWhu0BHaeVz2NQ=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: kuba@kernel.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Theodore Ts'o" <tytso@mit.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tech-board-discuss@lists.linux.dev
Subject: [PATCH] Add short author date to Fixes tag
Date: Fri, 10 Jan 2025 12:20:09 +0000
X-OQ-MSGID: <20250110122009.79873-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

The old Fixes tag style is at least 10 years old. It lacks date
information, which can lead to misjudgment. So I added short author date
to avoid this. This make it clear at a glance and reduce
misunderstandings.

For example:

Old Fixes tag style:
* Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")
* Fixes: a76053707dbf ("dev_ioctl: split out ndo_eth_ioctl")
This will make people mistakenly think that "a76053707dbf" broke
"fd3040b9394c".[1]

New Fixes tag style:
* Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021", 2022-05-08)
* Fixes: a76053707dbf ("dev_ioctl: split out ndo_eth_ioctl", 2021-07-27)
This makes it clear that the newly introduced driver did not follow the
existing changes.

[1] https://lore.kernel.org/all/20250109180212.71e4e53c@kernel.org/

docs: submitting-patches: The short author date of old example
"54a4f0239f2e" is 2010-05-05, which is not immediately obvious as
YYYY-MM-DD, so change example.

Fixes: 8401aa1f5997 ("Documentation/SubmittingPatches: describe the Fixes: tag", 2014-06-06)
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 Documentation/process/5.Posting.rst           |  2 +-
 Documentation/process/maintainer-tip.rst      |  4 +--
 .../process/researcher-guidelines.rst         |  2 +-
 Documentation/process/submitting-patches.rst  |  8 ++---
 scripts/checkpatch.pl                         | 30 +++++++++++--------
 5 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index b3eff03ea249..38c9c94e7448 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -199,7 +199,7 @@ document; what follows here is a brief summary.
 One tag is used to refer to earlier commits which introduced problems fixed by
 the patch::
 
-	Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID")
+	Fixes: 1f2e3d4c5b6a ("The first line of the commit specified by the first 12 characters of its SHA-1 ID", 2024-12-31)
 
 Another tag is used for linking web pages with additional backgrounds or
 details, for example an earlier discussion which leads to the patch or a
diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
index e374b67b3277..fb97a6853e42 100644
--- a/Documentation/process/maintainer-tip.rst
+++ b/Documentation/process/maintainer-tip.rst
@@ -270,7 +270,7 @@ Ordering of commit tags
 To have a uniform view of the commit tags, the tip maintainers use the
 following tag ordering scheme:
 
- - Fixes: 12char-SHA1 ("sub/sys: Original subject line")
+ - Fixes: 12char-SHA1 ("sub/sys: Original subject line", YYYY-MM-DD)
 
    A Fixes tag should be added even for changes which do not need to be
    backported to stable kernels, i.e. when addressing a recently introduced
@@ -295,7 +295,7 @@ following tag ordering scheme:
      The recent replacement of foo with bar left an unused instance of
      variable foo around. Remove it.
 
-     Fixes: abcdef012345678 ("x86/xxx: Replace foo with bar")
+     Fixes: abcdef012345678 ("x86/xxx: Replace foo with bar", 2024-12-31)
      Signed-off-by: J.Dev <j.dev@mail>
 
    The latter puts the information about the patch into the focus and
diff --git a/Documentation/process/researcher-guidelines.rst b/Documentation/process/researcher-guidelines.rst
index beb484c5965d..472ca0a4684d 100644
--- a/Documentation/process/researcher-guidelines.rst
+++ b/Documentation/process/researcher-guidelines.rst
@@ -149,7 +149,7 @@ For example::
   [1] https://url/to/leakmagic/details
 
   Reported-by: Researcher <researcher@email>
-  Fixes: aaaabbbbccccdddd ("Introduce support for FooBar")
+  Fixes: aaaabbbbccccdddd ("Introduce support for FooBar", 2024-12-31)
   Signed-off-by: Author <author@email>
   Reviewed-by: Reviewer <reviewer@email>
 
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1518bd57adab..4df1e722130b 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -148,7 +148,7 @@ the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
 lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
 parsing scripts.  For example::
 
-	Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
+	Fixes: 6a451e2c5c03 ("ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects", 2024-12-30)
 
 The following ``git config`` settings can be used to add a pretty format for
 outputting the above style in the ``git log`` or ``git show`` commands::
@@ -156,12 +156,12 @@ outputting the above style in the ``git log`` or ``git show`` commands::
 	[core]
 		abbrev = 12
 	[pretty]
-		fixes = Fixes: %h (\"%s\")
+		fixes = Fixes: %h (\"%s\", %as)
 
 An example call::
 
-	$ git log -1 --pretty=fixes 54a4f0239f2e
-	Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
+	$ git log -1 --pretty=fixes 6a451e2c5c03
+	Fixes: 6a451e2c5c03 ("ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects", 2024-12-30)
 
 .. _split_changes:
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..580d5620ec7d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1228,15 +1228,15 @@ sub git_is_single_file {
 }
 
 sub git_commit_info {
-	my ($commit, $id, $desc) = @_;
+	my ($commit, $id, $desc, $date) = @_;
 
-	return ($id, $desc) if ((which("git") eq "") || !(-e "$gitroot"));
+	return ($id, $desc, $date) if ((which("git") eq "") || !(-e "$gitroot"));
 
-	my $output = `${git_command} log --no-color --format='%H %s' -1 $commit 2>&1`;
+	my $output = `${git_command} log --no-color --format='%H %s %as' -1 $commit 2>&1`;
 	$output =~ s/^\s*//gm;
 	my @lines = split("\n", $output);
 
-	return ($id, $desc) if ($#lines < 0);
+	return ($id, $desc, $date) if ($#lines < 0);
 
 	if ($lines[0] =~ /^error: short SHA1 $commit is ambiguous/) {
 # Maybe one day convert this block of bash into something that returns
@@ -1253,10 +1253,11 @@ sub git_commit_info {
 		$id = undef;
 	} else {
 		$id = substr($lines[0], 0, 12);
-		$desc = substr($lines[0], 41);
+		$desc = substr($lines[0], 41, -11);
+		$date = substr($lines[0], -10);
 	}
 
-	return ($id, $desc);
+	return ($id, $desc, $date);
 }
 
 $chk_signoff = 0 if ($file);
@@ -3214,16 +3215,19 @@ sub process {
 			my $orig_commit = $2;
 			my $title;
 			my $title_has_quotes = 0;
+			my $date;
 			$fixes_tag = 1;
 			if (defined $3) {
+				$date = substr($3, -11, 10);
 				# Always strip leading/trailing parens then double quotes if existing
-				$title = substr($3, 1, -1);
+				$title = substr($3, 1, -13);
 				if ($title =~ /^".*"$/) {
 					$title = substr($title, 1, -1);
 					$title_has_quotes = 1;
 				}
 			} else {
-				$title = "commit title"
+				$title = "commit title";
+				$date = "YYYY-MM-DD";
 			}
 
 
@@ -3234,15 +3238,15 @@ sub process {
 			my $id_case = not ($orig_commit !~ /[A-F]/);
 
 			my $id = "0123456789ab";
-			my ($cid, $ctitle) = git_commit_info($orig_commit, $id,
-							     $title);
+			my ($cid, $ctitle, $cdate) = git_commit_info($orig_commit, $id,
+							     $title, $date);
 
-			if ($ctitle ne $title || $tag_case || $tag_space ||
+			if ($ctitle ne $title || $cdate ne $date || $tag_case || $tag_space ||
 			    $id_length || $id_case || !$title_has_quotes) {
 				if (WARN("BAD_FIXES_TAG",
-				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
+				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\", YYYY-MM-DD)' - ie: 'Fixes: $cid (\"$ctitle\", $cdate)'\n" . $herecurr) &&
 				    $fix) {
-					$fixed[$fixlinenr] = "Fixes: $cid (\"$ctitle\")";
+					$fixed[$fixlinenr] = "Fixes: $cid (\"$ctitle\", $cdate)";
 				}
 			}
 		}
-- 
2.43.0

