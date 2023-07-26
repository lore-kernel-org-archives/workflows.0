Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BCAC0015E
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 15:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234938AbjGZPQY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 11:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234355AbjGZPQK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 11:16:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFA630EB
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 08:15:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE92A61B54
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 15:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42F1C433C7;
        Wed, 26 Jul 2023 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690384527;
        bh=yqb0YdgIVLLbmhpJ7snqhokkIjG5EyFWE3z0t550FNU=;
        h=From:To:Cc:Subject:Date:From;
        b=OVs4MkrZalnVwhD1cqVycejNl1mfCnRTWRpwJ9SWo6AWMWtW5L6EZ9UQrXEJ3Y92G
         GH65g2C54gEVD0ErmdSUFxHeluVexM6Svvzp7+VVmAxm0WSnO9pQqWrNCDTLpRyPlf
         tis2TwGbND1SDGcekzspJFzE7tjGfMWGhEbr1goBAyl7g5Kq24YBuRwf5vAK/7nIfe
         QjP/yVoV0HjSdopNWOwIbYt8Pi3HykuAqo9ur578y4W1N/TpGU4T3r+6bPt5kVwZPV
         LWRyM0v8dZQtbx7Bt0JVYCaUkx3w2zqTgWTzt+L8JBy7g9GJO4wkUcoMWdbw2VEQkM
         3JQz2Q+mJzv2g==
From:   Jakub Kicinski <kuba@kernel.org>
To:     joe@perches.com
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: [PATCH v2] scripts: get_maintainer: steer people away from using file paths
Date:   Wed, 26 Jul 2023 08:15:15 -0700
Message-ID: <20230726151515.1650519-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

We repeatedly see netcomers misuse get_maintainer by running it on
the file paths rather than the patchfile. This leads to authors
of changes (quoted commits and commits under Fixes) not getting
CCed. These are usually the best reviewers!

The file option should really not be used by inexperienced developers,
unless they are just trying to find a maintainer to manually contact.

Print a warning when someone tries to use -f and remove
the "auto-guessing" of file paths.

This script may break people's "scripts on top of get_maintainer"
if they are using -f... but that's the point.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
note addressed:
 - put more info into the warning. I think it's more than fine.
v2:
 - fix the subject (Greg)
 - s/noob/inexperienced|newcomer/ (Joe)
 - put the message on a single line (Joe)
 - s/will/may/ (Joe)
 - s/filepatch/patchfile/
 - add more reasons to help
v1: https://lore.kernel.org/all/20230725155926.2775416-1-kuba@kernel.org/

CC: joe@perches.com
Cc: geert@linux-m68k.org
Cc: gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org
Cc: workflows@vger.kernel.org
Cc: mario.limonciello@amd.com
---
 scripts/get_maintainer.pl | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index ab123b498fd9..4714056ca7f1 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -51,6 +51,7 @@ my $output_roles = 0;
 my $output_rolestats = 1;
 my $output_section_maxlen = 50;
 my $scm = 0;
+my $silence_file_warning = 0;
 my $tree = 1;
 my $web = 0;
 my $subsystem = 0;
@@ -267,6 +268,7 @@ if (!GetOptions(
 		'subsystem!' => \$subsystem,
 		'status!' => \$status,
 		'scm!' => \$scm,
+		'silence-file-warning!' => \$silence_file_warning,
 		'tree!' => \$tree,
 		'web!' => \$web,
 		'letters=s' => \$letters,
@@ -544,7 +546,11 @@ foreach my $file (@ARGV) {
     if ($from_filename && (vcs_exists() && !vcs_file_exists($file))) {
 	warn "$P: file '$file' not found in version control $!\n";
     }
-    if ($from_filename || ($file ne "&STDIN" && vcs_file_exists($file))) {
+    if ($from_filename) {
+	if (!$silence_file_warning) {
+	    warn "$P: WARNING: Prefer running the script on patches as generated by git format-patch. Selecting paths is known to miss recipients!\n";
+	}
+
 	$file =~ s/^\Q${cur_path}\E//;	#strip any absolute path
 	$file =~ s/^\Q${lk_path}\E//;	#or the path to the lk tree
 	push(@files, $file);
@@ -1081,6 +1087,7 @@ version: $V
   --mailmap => use .mailmap file (default: $email_use_mailmap)
   --no-tree => run without a kernel tree
   --self-test => show potential issues with MAINTAINERS file content
+  --silence-file-warning => silence the warning about -f being used (see Notes)
   --version => show version
   --help => show this help information
 
@@ -1089,6 +1096,11 @@ version: $V
    --pattern-depth=0 --remove-duplicates --rolestats]
 
 Notes:
+  Using "-f file" is generally discouraged, running the script on a patchfile
+      (as generated by git format-patch) is usually the right thing to do.
+      It's easy to miss a file changed by a commit and the script
+      may extract additional information from the commit message
+      (keywords, Fixes tags etc.)
   Using "-f directory" may give unexpected results:
       Used with "--git", git signators for _all_ files in and below
           directory are examined as git recurses directories.
-- 
2.41.0

