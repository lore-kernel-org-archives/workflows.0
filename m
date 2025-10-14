Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27672D8393
	for <workflows@vger.kernel.org>; Tue, 14 Oct 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426132; cv=none; b=n9hodWC5bwFupCciIFbC0cn3LNq7UMoRb5rIbKO/fanlRbCICi59YNZcIUXrHOLyoSMju8R2nLX1t0GrS0qJHA0Hd9KtZ44GUaAitIlBmNPAN2D3GtzWLp8Yn7Hs41BP4TWipkIn0yZ4PWnkzBQiijigAX9Siz8H69tHxrB1PRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426132; c=relaxed/simple;
	bh=OBJvKitPmGJWyO3gkPAIimDU6unx8NsbCl0KgJcu4Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNxJNugHMFRdhpJhOmm+IsbJ8HFeP4W6WfA6003cwghg7w1XVB28b3PcfaagKirSwzO01VUVWxxlFhCgpAWMGnv7ZuilswQ+KPKfibSKwakRgKDVdCIgFB0RbtzheA/akXzJmzPuZSBB9pjVz0YbB7vvJJqJaeKOpJtn+aY1GiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSf1YdI5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSf1YdI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426131; x=1791962131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OBJvKitPmGJWyO3gkPAIimDU6unx8NsbCl0KgJcu4Nk=;
  b=OSf1YdI5s2FfrUJpEiz0e7ywU+KLIK9kMITPfnC6we6B8rjeJnK2OPGr
   czLF70S8ugLhhsUOMTZ8ebhM4kbjudrRIGbuZaQXpSxCkJ6SvGsoe6C0J
   8UH9A6LOaORjIWVhyhK9Al6bXKLAAO1WIEZzjVZl/q+SLdo/XR73tVmfk
   GaL+u3uDLCrvrcIVhIpEmDTW7HTW6E0QToSg1mbsg+bcf+n7EZLN5mUx7
   WlAEr4hXqCWfXD6WUCCMf0ntHoNemFy741mqZ1jxEuLGCZlCCOVH6zgXr
   O8dOM0yGWwyZxYBWSE302XO5P3r2Eq4flWdLcs7X/6UYe8CCmVpn7g2b/
   A==;
X-CSE-ConnectionGUID: 6Sjudk9fQXSIUhk4xXzBEA==
X-CSE-MsgGUID: Dosoq09FShe++EWae4Ew0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233799"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:15:29 -0700
X-CSE-ConnectionGUID: gK/XkDV/SWa4dff36Y8eqQ==
X-CSE-MsgGUID: sCjMFrUlSDGAVE5bFhVJbQ==
X-ExtLoop1: 1
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2025 00:15:29 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: konstantin@linuxfoundation.org
Cc: ksummit@lists.linux.dev,
	workflows@vger.kernel.org
Subject: [PATCH 2/3] b4, ty: Move git_get_rev_diff to __init__ for reuse in post processing shazam
Date: Tue, 14 Oct 2025 00:15:29 -0700
Message-ID: <20251014071530.3665691-3-dan.j.williams@intel.com>
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

In support of adding link trailers as git notes, factor out
git_get_rev_diff() for reuse.

Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 src/b4/__init__.py | 5 +++++
 src/b4/ty.py       | 7 +------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index c608a4d7956a..c2cdb028fa54 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2932,6 +2932,11 @@ def in_directory(dirname: str) -> Generator[bool, None, None]:
         os.chdir(cdir)
 
 
+def git_get_rev_diff(gitdir: Optional[str], rev: str) -> Tuple[int, str]:
+    args = ['diff', '%s~..%s' % (rev, rev)]
+    return git_run_command(gitdir, args)
+
+
 def setup_config(cmdargs: argparse.Namespace) -> None:
     """Setup configuration options. Needs to be called before accessing any of
     the config options."""
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 9f01bd534c74..8d41a22e536b 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -70,11 +70,6 @@ def git_get_merge_id(gitdir: Optional[str], commit_id: str, branch: Optional[str
     return lines[-1]
 
 
-def git_get_rev_diff(gitdir: Optional[str], rev: str) -> Tuple[int, str]:
-    args = ['diff', '%s~..%s' % (rev, rev)]
-    return b4.git_run_command(gitdir, args)
-
-
 def git_get_commit_message(gitdir: Optional[str], rev: str) -> Tuple[int, str]:
     args = ['log', '--format=%B', '-1', rev]
     return b4.git_run_command(gitdir, args)
@@ -191,7 +186,7 @@ def get_all_commits(gitdir: Optional[str], branch: str, since: str = '1.week',
     # Get patch hash of each commit
     for line in lines:
         commit_id, subject = line.split(maxsplit=1)
-        ecode, out = git_get_rev_diff(gitdir, commit_id)
+        ecode, out = b4.git_get_rev_diff(gitdir, commit_id)
         pwhash = b4.LoreMessage.get_patchwork_hash(out)
         logger.debug('phash=%s', pwhash)
         # get all message-id or link trailers
-- 
2.51.0

