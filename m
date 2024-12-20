Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A511A8417
	for <workflows@vger.kernel.org>; Fri, 20 Dec 2024 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685806; cv=none; b=pdpD5jQ1AHkpzppd5N0EvBl74iS+zjGHLi8BPCkmBmBBv6jt4Hse7SSwDcbGc5imdDh8kSJ+7GMskyVxyEIOLXc+TKFi1ty6UZu7dY0dbjjmBkUnJB7Szk63ZHzgV/+g4ndQ+yG9Tb7sw/8PtP6aNotJN1Q1hPwsKX8avMfQepU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685806; c=relaxed/simple;
	bh=gHiGdDoFkBP7qlbsiA+qG4qxkEBIY0sSiY7ZcKKmu8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdoMxAFuXXTkkaA+ENlmcuI2yUIf64jM7pQCJczGmIkTs2VVM8Lp3hM6oo1JBefX9bJs+rhzpnKIrnqtUKVbbbXp/Mkh6QhGogQfZCm95pL0FN0iV/Cq7LmX562VZo3Cga/WUFu8ZvGrm9ZZH2JyGIctd0QVBx56GMm5VwwkNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ10-0001DZ-CS; Fri, 20 Dec 2024 10:09:46 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ0z-004LrC-0l;
	Fri, 20 Dec 2024 10:09:46 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ0z-00HILv-33;
	Fri, 20 Dec 2024 10:09:45 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Fri, 20 Dec 2024 10:09:35 +0100
Subject: [PATCH RFC 2/2] docs: process: submitting-patches: clarify
 imperative mood suggestion
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-submitting-patches-imperative-v1-2-ee874c1859b3@pengutronix.de>
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

While we expect commit message titles to use the imperative mood,
it's ok for commit message bodies to first include a blurb describing
the background of the patch, before delving into what's being done
to address the situation.

Make this clearer by adding a clarification after the imperative mood
suggestion as well as listing Rob Herring's commit 52bb69be6790
("dt-bindings: ata: pata-common: Add missing additionalProperties on
child nodes") as a good example commit message.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
I liked Rob's commit message, because:

  - It has multiple subsystem prefixes
  - Uses imperative mood in the commit message title
  - Doesn't use it in the commit message body showing that it's
    not a hard requirement
  - Is short and gives a succinct background
  - Explains not only why to do the change, but also why it's ok
    to do it

Admittedly though, a C example may be easier to grok for a general
audience. I can search for one if that's preferred (or maybe someone
has a suitable commit already they wish to suggest?)
---
 Documentation/process/submitting-patches.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1474c84b3ac562f5806d85e8ef5b6e9d23572e59..b10534e460aa30f2751208bd1eca242841ba5edb 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -96,6 +96,11 @@ instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
 to do frotz", as if you are giving orders to the codebase to change
 its behaviour.
 
+The goal of the imperative mood is to make especially commit message
+titles (the :ref:`patch_subject_line`) succinct and to the point.
+The explanation body should be more detailed and take care to explain
+the background motivating the change. (see :ref:`patch_explanation_body`).
+
 If you want to refer to a specific commit, don't just refer to the
 SHA-1 ID of the commit. Please also include the oneline summary of
 the commit, to make it easier for reviewers to know what it is about.
@@ -610,6 +615,8 @@ that, if you have your patches stored in a ``git`` repository, proper patch
 formatting can be had with ``git format-patch``.  The tools cannot create
 the necessary text, though, so read the instructions below anyway.
 
+.. _patch_subject_line:
+
 Subject Line
 ^^^^^^^^^^^^
 
@@ -699,6 +706,8 @@ patch in the permanent changelog.  If the ``from`` line is missing,
 then the ``From:`` line from the email header will be used to determine
 the patch author in the changelog.
 
+.. _patch_explanation_body:
+
 Explanation Body
 ^^^^^^^^^^^^^^^^
 
@@ -717,6 +726,15 @@ _all_ of the compile failures; just enough that it is likely that
 someone searching for the patch can find it. As in the ``summary
 phrase``, it is important to be both succinct as well as descriptive.
 
+Here is one example of a good commit message::
+
+  dt-bindings: ata: pata-common: Add missing additionalProperties on child nodes
+
+  The PATA child node schema is missing constraints to prevent unknown
+  properties. As none of the users of this common binding extend the child
+  nodes with additional properties, adding "additionalProperties: false"
+  here is sufficient.
+
 .. _backtraces:
 
 Backtraces in commit messages

-- 
2.39.5

