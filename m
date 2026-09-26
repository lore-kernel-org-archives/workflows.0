Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AFF318EE7
	for <workflows@vger.kernel.org>; Sat, 26 Sep 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405164; cv=none; b=SzU4E4pWAAcjnBrisIG/xBo3IvWhdJhAARBWVuvnIRmL4gPzFA/6X0YYeJD/vDzJZPBRcJa/mMxYDKRxCbgPcqsVokH47jp9DqgR1cMQjKKJcwIAgm0fAk11jtleqms2A1I8gkDFrpmkzLcAyint0I85RhdD8M0xYe0UvPcVl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405164; c=relaxed/simple;
	bh=osZJUQiF3KkacBcGS34QyS4YOkYrOMsnl2xCEEHffCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1tvWe6eda4SYVH4/ZPjXjO4RGw42tGMO+96ILbZ6l0vk7ze7hPs9ReI5gYHFtQqqTgT3hfG6wIU36YmHgAolSjSuGjy8vU6oG9afngKeF99gP9HYr4j8Djw/KMtKQyvd7wmeQWkCMlPFft9KjxFpSAbSyJHY/yIm9RiL/YzQnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Qo8qFbt6; arc=none smtp.client-ip=91.218.175.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Qo8qFbt6"
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=osZJUQiF3KkacBcGS34QyS4YOkYrOMsnl2xCEEHffCo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790405159; v=1; x=1791009959;
 b=Qo8qFbt68RywaqQ/OqiT9TwG/zTzaVMKYjl96HpL815lx1B7tBI+Lw97j4Lx3579H3JIs3/v
 2SuaSlcx5JE9hy/Mo4XngHbCT7TZ9ueUB1DX4ASPa0r9NjLYqtSjzqD5GR9DhA+hY+yeoXxuC94
 3iyMBJhLKIt0F8DTWbvqr4XJ68DKBNneoy358jNQcKEcrh9VMWNPXYZrFUvlDtVvvDn7ovavI2+
 R8fg+ldMHvfNQMZQ5ebI1nPy5nhGg/1TXdzzlxgg61OqqS0Pl+8GkYxg2Lr1oI0jKQr5/yuFg0A
 VtUOvPdWf9UrSPk63KVzgi5ZbVN9jRcBNkkad1wlDhSPw==
X-Envelope-To: workflows@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c70aecb6a245a95a;
	Sat, 26 Sep 2026 06:45:49 +0000
X-Mizu-Trace-ID: c70aecb6a245a95a
X-Migadu-Flow: FLOW_OUT
Date: Sat, 26 Sep 2026 14:45:45 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: submitting-patches: use git switch to create branches
Message-ID: <ardqGdjnd7kC1B-E@wyuan.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Weijie Yuan <wy@wyuan.org>

Git has been promoting "git switch" since git.git commit 328c6cb853d7
(doc: promote "git switch"), and the command is no longer experimental
as of Git 2.51.0.

Suggested-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/process/submitting-patches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 4c28a239e8cb..63a5550bd490 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -866,7 +866,7 @@ automatically include the base tree information in your submission by
 using the ``--base`` flag. The easiest and most convenient way to use
 this option is with topical branches::
 
-    $ git checkout -t -b my-topical-branch master
+    $ git switch -t -c my-topical-branch master
     Branch 'my-topical-branch' set up to track local branch 'master'.
     Switched to a new branch 'my-topical-branch'
 
@@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
 bottom, which provides the reviewer and the CI tools enough information
 to properly perform ``git am`` without worrying about conflicts::
 
-    $ git checkout -b patch-review [base-commit-id]
+    $ git switch -c patch-review [base-commit-id]
     Switched to a new branch 'patch-review'
     $ git am patches.mbox
     Applying: First Commit
-- 
2.55.0.1055.g20c0e7c0fb.dirty

