Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A527381B
	for <workflows@vger.kernel.org>; Tue, 14 Oct 2025 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426133; cv=none; b=qYYTwxtXmeYmY+SpNl5gYaPXJ03aAlhceM8LFAcqsLjLSxitPjfAlLJJZpLFeFYBDuYVJ9LEKBsdtSOQ7SZEvmC7O5ZSw/4dLROipvMXdzEeCsNH1hmg1tlbzGu76FrEMswFKk9K9gD85lRVpTFScCGnVe3wYDu44c58cKXnx1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426133; c=relaxed/simple;
	bh=9xXkA0Oy7lWFJZFbb1GJ7sgzsTKVV6mz1nXqumnOJrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9CnEsjlyD8iCUp6dz4btpe4luBcn+efAtMXJ+CWZFRA3LqtpoNiobJj21XohcByeTCOaIPeBlOzxFFKprmLCLmBzdlMFyhcjzZIa7uHkyDlD5UQORdbT7KFKo7lPgzKipHjzLZkni9Qd9/cxkn6qkaEXsXNpD11fJXQyc5FHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViDoyIDg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViDoyIDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426132; x=1791962132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9xXkA0Oy7lWFJZFbb1GJ7sgzsTKVV6mz1nXqumnOJrc=;
  b=ViDoyIDg9iqD4K3yvqINpm65y6jMgHy9Umb7ggXDHdnshiyNrwrugutg
   YsOtSXIIKHimcRKjZZLmOzVfpuOSsNeLIz2nJsG1nL5Q07HaZXsPwTidZ
   vNo5Jqfrp1vHO+fyaV4OI1jo7zXjEMILKosr6Z9ecfwB7+4eHOm0O3myq
   JYL/2iL0IshwOGu2rm8wzhztrggbjQaQf4n0ZC21CKz2fCe5HmOUANdqR
   01/PahjNarL8fKhisFpb5lGZMFliPP+KG5HJU1bXvxKQI/7KHuY+Xvq27
   jVbxbS7sohwTnNTqr+Y7hHMGC5dkV4VVhEV2cYzjOehJvRwfXA/VHrpT8
   g==;
X-CSE-ConnectionGUID: UNvFlu0jQ3ubiVr7IjzcJA==
X-CSE-MsgGUID: +abJQeCzR8i+2+5n4w5YZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233802"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:15:29 -0700
X-CSE-ConnectionGUID: FRrEElZpQZy+Bz+SQAC06g==
X-CSE-MsgGUID: BDihkOTPTpm45ClAKNt1mA==
X-ExtLoop1: 1
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2025 00:15:29 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: konstantin@linuxfoundation.org
Cc: ksummit@lists.linux.dev,
	workflows@vger.kernel.org
Subject: [PATCH 3/3] mbox: Add a --add-link-note option to shazam
Date: Tue, 14 Oct 2025 00:15:30 -0700
Message-ID: <20251014071530.3665691-4-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014071530.3665691-1-dan.j.williams@intel.com>
References: <20251014071530.3665691-1-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the Link: tag is disruptive to some top-level maintainer workflows
[1], it is also useful to a significant number of developers and subsystem
maintainers.

It is also the case that dynamic patch-id lookup [2] is an incomplete
replacement for having the submission Link: trailer readily available.
Specifically, navigating to a patch on gitweb or displaying the patch in
the local developer tree it is convenient to have the metadata inline.

A method to have that metadata available without polluting upstream is to
keep git notes locally.

Add a new option to shazam that annotates newly applied commits with the
Link: trailer of the submission. Honor the b4.linkmask option to use the
preferred namespace (patch.msgid.link) for these links.

Note: Claude Sonnet 4 was used to help early drafts of this patch, but all
submitted lines are authored by me or copied from other parts of b4.

Link: http://lore.kernel.org/CAHk-=whP2zoFm+-EmgQ69-00cxM5jgoEGWyAYVQ8bQYFbb2j=Q@mail.gmail.com [1]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 src/b4/command.py |  2 ++
 src/b4/mbox.py    | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/src/b4/command.py b/src/b4/command.py
index 455124d9726a..678b0b53d6b9 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -211,6 +211,8 @@ def setup_parser() -> argparse.ArgumentParser:
     sp_sh = subparsers.add_parser('shazam', help='Like b4 am, but applies the series to your tree')
     cmd_retrieval_common_opts(sp_sh)
     cmd_am_common_opts(sp_sh)
+    sp_sh.add_argument('-L', '--add-link-note', dest='addlinknote', action='store_true', default=False,
+                       help='Add a git note with Link: trailer for every created commit')
     sh_g = sp_sh.add_mutually_exclusive_group()
     sh_g.add_argument('-H', '--make-fetch-head', dest='makefetchhead', action='store_true', default=False,
                       help='Attempt to treat series as a pull request and fetch it into FETCH_HEAD')
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 8810ddd71b21..9479b8995019 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -354,6 +354,8 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             logger.info(out.strip())
             if ecode == 0:
                 thanks_record_am(lser, cherrypick=cherrypick)
+                if cmdargs.addlinknote:
+                    shazam_notes(topdir, lser, 'HEAD')
             sys.exit(ecode)
 
         base_commit = get_base_commit(topdir, first_body, lser, cmdargs)
@@ -448,6 +450,9 @@ def make_am(msgs: List[EmailMessage], cmdargs: argparse.Namespace, msgid: str) -
             # We exec git-merge and let it take over
             os.execvp(mergecmd[0], mergecmd)
 
+        if cmdargs.addlinknote:
+            shazam_notes(topdir, lser, 'FETCH_HEAD')
+
         logger.info('You can now merge or checkout FETCH_HEAD')
         logger.info('  e.g.: %s', ' '.join(mergecmd))
         sys.exit(0)
@@ -547,6 +552,59 @@ def thanks_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> No
         b4.patchwork_set_state(msgids, pwstate)
 
 
+def commits_by_patchid(gitdir: Optional[str], branch: str, num_patches: int) -> b4.Dict[str, str]:
+    """Create a patch-id to commit lookup for the top N commits"""
+
+    commits = dict()
+
+    args = ['log', '--no-abbrev', '--no-decorate', '--oneline', f'-{num_patches}', branch]
+    lines = b4.git_get_command_lines(gitdir, args)
+    if not lines:
+        return commits
+
+    for line in lines:
+        commit_id, subject = line.split(maxsplit=1)
+
+        ecode, diff_out = b4.git_get_rev_diff(gitdir, commit_id)
+        if ecode != 0 or not diff_out.strip():
+            continue
+
+        patch_id = b4.LoreMessage.get_patch_id(diff_out)
+        if patch_id:
+            commits[patch_id] = commit_id
+
+    return commits
+
+
+def shazam_notes(gitdir: Optional[str], lser: 'b4.LoreSeries', branch: str) -> None:
+    """Match commits to LoreMessages using git patch-id and emit debug info for later git notes processing."""
+    if not lser or not lser.patches:
+        return
+
+    lmsgs = [lmsg for lmsg in lser.patches if lmsg is not None and lmsg.has_diff]
+    if not lmsgs:
+        return
+
+    # Cache recently applied commits by patch-id (account for a merge commit)
+    commits = commits_by_patchid(gitdir, branch, len(lmsgs) + 1)
+    if not commits:
+        return
+
+    # Add link trailer notes
+    for lmsg in lmsgs:
+        patch_id = lmsg.git_patch_id
+        if not patch_id:
+            continue
+
+        if patch_id not in commits:
+            continue
+
+        commit_id = commits[patch_id]
+        linktrailer = lmsg.linktrailer
+        note_message = f"{linktrailer.name}: {linktrailer.value}"
+
+        b4.git_run_command(gitdir, ['notes', 'append', '-m', note_message, commit_id])
+
 def save_as_quilt(am_msgs: List[EmailMessage], q_dirname: str) -> None:
     if os.path.exists(q_dirname):
         logger.critical('ERROR: Directory %s exists, not saving quilt patches', q_dirname)
-- 
2.51.0

