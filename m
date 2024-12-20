Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830021A0BED
	for <workflows@vger.kernel.org>; Fri, 20 Dec 2024 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685792; cv=none; b=uwXB4l7mc+AwTUVeT2uIz/EE2girXdfb32+vKqcQIfG5HYu1NAO0K7l+YS24g1NdIk9L5Fat1IaIc9/UXquHkRg564ogr65CR2xe1HGWbbKwKgP8Wisn/1kbgW4CFpgHiPB9lDE/guqLYykc8nOzovWXM9zr73jgD3TNplSLo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685792; c=relaxed/simple;
	bh=8xR4PZzqOumB/ZRcnnAflNpmwuMlSHUJCOTF/duVoQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZx8o4sPu9+w+wsgZRL65jW62kQt/sB/juHotrZoDcqzaARBMiA9zoePA8ysBjKKkjLYrWtdTpc+Wwldukprd1J40LS9j4ztW270q4xLod14ClXw4d4mve3tgd3hBQJbi415ZH8eevnERYlcC1dodfK/U7WRcT/+pmm3ssws+0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ10-0001DX-CS; Fri, 20 Dec 2024 10:09:46 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ0z-004LrB-0k;
	Fri, 20 Dec 2024 10:09:46 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ0z-00HILv-32;
	Fri, 20 Dec 2024 10:09:45 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Fri, 20 Dec 2024 10:09:34 +0100
Subject: [PATCH RFC 1/2] docs: process: submitting-patches: split canonical
 patch format section
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-submitting-patches-imperative-v1-1-ee874c1859b3@pengutronix.de>
References: <20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de>
In-Reply-To: <20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, 
 Rob Herring <robh@kernel.org>, Frank Li <Frank.li@nxp.com>, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: workflows@vger.kernel.org

To make it easier to reference specific parts of the patch format,
let's add some headings for different parts.

Doing that, it becomes clear that backtraces in commit message is out of
place being after Reply-To Headers, so move it next to the commit
message body subsubsection.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/process/submitting-patches.rst | 56 +++++++++++++++++-----------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1518bd57adab501f7a7cf2fdfb9ac3f3a870766e..1474c84b3ac562f5806d85e8ef5b6e9d23572e59 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -610,6 +610,9 @@ that, if you have your patches stored in a ``git`` repository, proper patch
 formatting can be had with ``git format-patch``.  The tools cannot create
 the necessary text, though, so read the instructions below anyway.
 
+Subject Line
+^^^^^^^^^^^^
+
 The canonical patch subject line is::
 
     Subject: [PATCH 001/123] subsystem: summary phrase
@@ -683,6 +686,9 @@ Here are some good example Subjects::
     Subject: [PATCH v2] sub/sys: Condensed patch summary
     Subject: [PATCH v2 M/N] sub/sys: Condensed patch summary
 
+From Line
+^^^^^^^^^
+
 The ``from`` line must be the very first line in the message body,
 and has the form:
 
@@ -693,6 +699,9 @@ patch in the permanent changelog.  If the ``from`` line is missing,
 then the ``From:`` line from the email header will be used to determine
 the patch author in the changelog.
 
+Explanation Body
+^^^^^^^^^^^^^^^^
+
 The explanation body will be committed to the permanent source
 changelog, so should make sense to a competent reader who has long since
 forgotten the immediate details of the discussion that might have led to
@@ -708,6 +717,31 @@ _all_ of the compile failures; just enough that it is likely that
 someone searching for the patch can find it. As in the ``summary
 phrase``, it is important to be both succinct as well as descriptive.
 
+.. _backtraces:
+
+Backtraces in commit messages
+"""""""""""""""""""""""""""""
+
+Backtraces help document the call chain leading to a problem. However,
+not all backtraces are helpful. For example, early boot call chains are
+unique and obvious. Copying the full dmesg output verbatim, however,
+adds distracting information like timestamps, module lists, register and
+stack dumps.
+
+Therefore, the most useful backtraces should distill the relevant
+information from the dump, which makes it easier to focus on the real
+issue. Here is an example of a well-trimmed backtrace::
+
+  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
+  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
+  Call Trace:
+  mba_wrmsr
+  update_domains
+  rdtgroup_mkdir
+
+Commentary
+^^^^^^^^^^
+
 The ``---`` marker line serves the essential purpose of marking for
 patch handling tools where the changelog message ends.
 
@@ -746,28 +780,6 @@ patch::
 See more details on the proper patch format in the following
 references.
 
-.. _backtraces:
-
-Backtraces in commit messages
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-Backtraces help document the call chain leading to a problem. However,
-not all backtraces are helpful. For example, early boot call chains are
-unique and obvious. Copying the full dmesg output verbatim, however,
-adds distracting information like timestamps, module lists, register and
-stack dumps.
-
-Therefore, the most useful backtraces should distill the relevant
-information from the dump, which makes it easier to focus on the real
-issue. Here is an example of a well-trimmed backtrace::
-
-  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
-  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
-  Call Trace:
-  mba_wrmsr
-  update_domains
-  rdtgroup_mkdir
-
 .. _explicit_in_reply_to:
 
 Explicit In-Reply-To headers

-- 
2.39.5

