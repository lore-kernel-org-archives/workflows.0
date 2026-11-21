Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279176;
	b=La1AqbGhgFIUJUME6FmX3cEfKpkCyv9YxZaRDyicT7WBy5sP5q7KscG7Kb3G361VeyXL
	 Pr64FV/dQwkV11eiarjvuYbnw+thYmbJaG0u+ouuPHp7mr95GFX+BcZxRIIv6ZzgX9cVR
	 kMlSkAsa2r864Qa+pStT8MOOkOWo1bdcL0W8ZnDaYNNfJSMKiB616HJm9q2+uoFdFO35j
	 TZrI19MOFJa3BM4CFGe1EbQIdhHFJ7K9hdiVtzeHpFFB/s3ECGODQt5Xo/IJ1exmy4uRa
	 ZXT+XWStpgyNF7DCWAsvjYVQoUYLdhBjYZsAVKMtswbwJCkc6T7NFW+RXz/i/yw5I3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279176;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/FJa0YKrjwZMvH1T3LFx4kvl4FYxJAnVRnSXaDUuM3U=;
	b=IoTsr2litC7aCH37/c+0Hm+4Epj0l3IyO26CH8l0iR4maHbJ8hgRBkVxd3v3utZO4HlM
	 I8sxKPKyhO1aOppKrmURDGzjsBnr8w6oQelmnw5M436kaxzzqSnBBP9WCzIVsvQbseR04
	 aO5TxNcNyfWYFnEexxuoMwAj3T39Ov3yoD1t8XXBvoIY5w6zcsbvnsKw+JPTP2GsWygNj
	 mOXCG8dkqKOTsG4qc6HNgboOt3VVoiVm2CAzgO8oO0KrJ9oS86iT+hLf4tI1OO7wSjvBL
	 D0F+8hCChOk0F/bNIWwC2AloDUZqpjMR3I+XRz6Km4wMz5MlSONGYV7cXdXxmJ+74UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jkvIW6Ig;
	arc=none smtp.remote-ip=91.218.175.192
Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A5F606A33A
	for <workflows@vger.kernel.org>; Sat, 21 Nov 2026 16:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A5F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jkvIW6Ig
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xQSQnIX8raJF/hgFXgzRdEzLlLyIPtrwOYZNaWtJQZs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795279173; v=1; x=1795883973;
 b=jkvIW6Ig/pc4wWragxuU1FptBmqEOaeQucYm5LI06IzRlUF2uWEFWydicTNmgrAVFEJrScNi
 whCww2krSTBkVgZ2hrB5IBhKfh8Vor4lirtx/uXIxAaxWkfrDbT43Zi6gZYDSLYAhGkpecIddHt
 OKD81Ed5ZNak5SJbIcHKLJkQ=
X-Envelope-To: workflows@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bd5e0a847ed539e5;
	Sat, 21 Nov 2026 16:39:33 +0000
X-Mizu-Trace-ID: bd5e0a847ed539e5
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs: submitting-patches: use :ref: links and remove unused anchor
Date: Sun, 22 Nov 2026 00:39:23 +0800
Message-ID: <20261121163923.73026-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert three plain-text references to the "Tagging people requires
permission" section into proper :ref: links using the existing
tagging_people anchor. Remove the explicit_in_reply_to anchor, which is not
referenced anywhere.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/process/submitting-patches.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..7126f25e2ac4 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -496,8 +496,9 @@ If a person has had the opportunity to comment on a patch, but has not
 provided such comments, you may optionally add a ``Cc:`` tag to the patch.
 This tag documents that potentially interested parties have been included in
 the discussion. Note, this is one of only three tags you might be able to use
-without explicit permission of the person named (see 'Tagging people requires
-permission' below for details).
+without explicit permission of the person named (see
+:ref:`Tagging people requires permission <tagging_people>` below for
+details).
 
 Co-developed-by: states that the patch was co-created by multiple developers;
 it is used to give attribution to co-authors (in addition to the author
@@ -545,7 +546,8 @@ followed by a Closes: tag pointing to the report, unless the report is not
 available on the web. The Link: tag can be used instead of Closes: if the patch
 fixes a part of the issue(s) being reported. Note, the Reported-by tag is one
 of only three tags you might be able to use without explicit permission of the
-person named (see 'Tagging people requires permission' below for details).
+person named (see :ref:`Tagging people requires permission <tagging_people>`
+below for details).
 
 A Tested-by: tag indicates that the patch has been successfully tested (in
 some environment) by the person named.  This tag informs maintainers that
@@ -598,8 +600,9 @@ A Suggested-by: tag indicates that the patch idea is suggested by the person
 named and ensures credit to the person for the idea: if we diligently credit
 our idea reporters, they will, hopefully, be inspired to help us again in the
 future. Note, this is one of only three tags you might be able to use without
-explicit permission of the person named (see 'Tagging people requires
-permission' below for details).
+explicit permission of the person named (see
+:ref:`Tagging people requires permission <tagging_people>` below for
+details).
 
 A Fixes: tag indicates that the patch fixes a bug in a previous commit. It
 is used to make it easy to determine where an issue originated, which can help
@@ -822,8 +825,6 @@ lore.kernel.org archive link) is recommended to help reviewers::
 See more details on the proper patch format in the following
 references.
 
-.. _explicit_in_reply_to:
-
 Explicit In-Reply-To headers
 ----------------------------
 
-- 
2.56.0

