Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF037083C;
	Fri, 24 Apr 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053524; cv=none; b=cVQQcZ4F1K4GBeSiP/J0OVdiILrLWVtfwX797EY3Jx3NBbNZLElccMvHU9v3rRG0moq5Xto+KWaKNP56rDgkGqO0QVQ1oZ3i6VO0mFRxfPvTKbaNaH5IYN5PJk53It7Pl7IEiy3TprtnqKJ+j5v3XABaaQCAzRSb5nJ4TOzJwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053524; c=relaxed/simple;
	bh=sj2zLB+Bl1tnaPu7qA0bLpFA09Tf7aV9cm6dXK29j2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxKIRgaYQ+8oLxT86xMHKMN8sZx0hRT7P7ngTjvcWqVvOiNv1Z734kmtvFlOvpUX9lbxvDdiHG5s8Tu3qC6EMTMrTABjNfde6t9X2okkIua8PVZ3Wf7VkS0LD1W5UeV/hz+3tM7lP3F81rz3/mm00CiXXfh6aaaySC8YMXNp/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R9qkjMSy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pwT3bnAO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R9qkjMSy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pwT3bnAO"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g2LL85nN1z9vH2;
	Fri, 24 Apr 2026 19:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777053520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbmj4N7zVRXMGmZLFvMThNK9FT5J1PyFY4flNNsMSN8=;
	b=R9qkjMSyiwaQjWRzXBNpTSUIWbWsAfXsv49hFEeAOdYYlwR+JiW6o+S45yOmPKBHGQVUpT
	1O8J6J9TvxacnjFiCOyHVnsPZ0KvjnzBJDNVv+j6pQ4/ovOO99PEbPHzkgagw0ANLSUwi1
	EgWR63TXF30/qVnUEx/blRgVibsi3Qi4/SC9geXIeGR3o9qHtjk6GkXzG5qv8BTJlAwUZU
	ZQTZCxH9OzeEsc5NAFMLwxs27CecxtJKIf3NVZFhmXVZREYPmdm1IrUpoFJsSFqy+KJrXb
	X6qkle2GxesheTs8L4DSU/EE9cSPl5UJDm7C4gGSmcLe407g73hl/0qxg/6amg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777053519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbmj4N7zVRXMGmZLFvMThNK9FT5J1PyFY4flNNsMSN8=;
	b=pwT3bnAOb25Bn9wWaYULL37PxonTvnBMeSVvOzX9cI6Q8bdWB6m0RNqSW4mp5GcFT86Dml
	YPt1tzGS2UP5PiuFkJ+Sq69vvixA7YUSmUqC3+b5BZuY2S+nPBUP4pI9ISYnqfsx6SFUDr
	ZfAxlDErVCukSTZgDzhz5AARbasAUmDGECgNs+AVqhu0U5r3bCqnrzXdch6zC+O4PTc1VE
	1YywZhgGJ9Hh7OwvqnY3rwCNIa7UoC4evGzCq4OdTJ4ACgD7OUr5w2HBvOpmLvUXeQLDVW
	3YEs13xtO8IfshXpfKUsAuETjeaCHnf77FD8c3SVVQSKSOZ6JE9oQfoNXBzGAA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org,
	linux-mm@kvack.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v3 3/3] Documentation: deprecated.rst: kmalloc-family: mark argument as optional
Date: Fri, 24 Apr 2026 19:57:41 +0200
Message-ID: <20260424175740.258522-2-manuelebner@mailbox.org>
In-Reply-To: <20260424174743.257951-2-manuelebner@mailbox.org>
References: <20260424174743.257951-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ea0f62450519231096e
X-MBO-RS-META: bw1i5j7yaog7suqknwjmjp5j44mwcpws

put the optional argument (gfp) in square brackets
add whitespace for readability

eg. ptr = kmalloc_obj(*ptr, gfp);
 -> ptr = kmalloc_obj(*ptr [, gfp] );

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/deprecated.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..b431993fd08e 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -392,12 +392,12 @@ allocations. For example, these open coded assignments::
 
 become, respectively::
 
-	ptr = kmalloc_obj(*ptr, gfp);
-	ptr = kzalloc_obj(*ptr, gfp);
-	ptr = kmalloc_objs(*ptr, count, gfp);
-	ptr = kzalloc_objs(*ptr, count, gfp);
-	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
-	__auto_type ptr = kmalloc_obj(struct foo, gfp);
+	ptr = kmalloc_obj(*ptr [, gfp] );
+	ptr = kzalloc_obj(*ptr [, gfp] );
+	ptr = kmalloc_objs(*ptr, count [, gfp] );
+	ptr = kzalloc_objs(*ptr, count [, gfp] );
+	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
+	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
 
 If `ptr->flex_member` is annotated with __counted_by(), the allocation
 will automatically fail if `count` is larger than the maximum
-- 
2.53.0

