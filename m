Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE231F99B;
	Tue, 21 Apr 2026 18:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776794995; cv=none; b=b/aOQF73nl4gkK3UDWQ72RIxv89gP+bZA1aR6DHN3keDfO9OvC3d1s+eHlvZ5RkkMMDcUzIcEOk3HVFl4AwIe4L8RF4m3C8GsZ/zu9lvtFdKyRGITp0kEecAICuYmtuuBvztzhe2GjMe8U2VSAkWgJtDxDTgFkIm/KhIuupdOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776794995; c=relaxed/simple;
	bh=YyAT2nSoOpWYijPC49OnL88+Z6Jjp7YCuHQ0kvJ3LwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZsp8COCv+horx+WNMDSU4LQMlMc3EzvDpadYfgeT5OHJbpQaCjlPns9qkPguUiYYIcgpCUbFTtwSh7xeVlBBA5LdsmRyTAL+il/lJfwd4Rp7h92us48z72aDdJx68Wfu0Dz5sFDtI//Dq3LzgDIdi+BXI1JMz4JsptAem8RiVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dHgbuT+v; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xaln1Rmo; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dHgbuT+v";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xaln1Rmo"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g0VkR6p4Nz9tR2;
	Tue, 21 Apr 2026 20:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776794992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/kiXnOT8WKo2A1b51FrTnCoza6nY7VThaSoPWPoS88=;
	b=dHgbuT+vfyg+LWgNwusrF5o80pJzCLWiA+hFdG6huxPIMljyUL7xLuV3eKiE9Ic18lQED/
	6VeSkIhZjVCULwx8PjnsFV+cRpyYY0xA+hWYiAtlSHBB6DyOvNJsPHyT8KJM9gVXRHBXhf
	/5XmX0GvErnCJjeYDdEeF5tiqYZT4ew3xhANONSLRzFfU7so8r++t/aN7UO7sYR3/5+CNx
	zrJ9fVocM8uutUKZK9ep4S+L3fdP+ikNZ8AzAisnr/ATa6EOOUbo/2ud2O1/kKXDhxMQXc
	e+KlKi1C8UtvkGzQWMdlb48BSKM/ZgeQnouLEmBAge72ynZHyGstLtq/1ssvxw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776794990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/kiXnOT8WKo2A1b51FrTnCoza6nY7VThaSoPWPoS88=;
	b=xaln1Rmok8ATE7+JgvxSdZvW4KpiP41wpFXrm1xL6vt1TuhFY9Y68uSAlvpUjapKWrdKNV
	cDSvignVTfLg+GQnbOmNZpRifwUI/d+QGDbXXzpYhWWkmzCqTW2XIQDxDJL09u7jj4GTj9
	15fOOczQ3oZHxTZbOFemkMoZIo+PfOKERFqa9KPoX9/rnu+didxnE/QDTE1i4Blx9al1ZI
	oxn0IKmqEe1nF4jUvmSZDhvHgqKLlzyOw4gojBHDYrzRLaorcgZNHXAQAXVdkqdG/Ikh+y
	qnzZJIAqLhJ0K2g8dwlMsr/AjkwI8vDR72rTbr+Y2zY1HvqfUSRkMUzRAkWZSw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 3/3] Documentation: deprecated.rst: kmalloc-family: mark argument as optional
Date: Tue, 21 Apr 2026 20:09:03 +0200
Message-ID: <20260421180902.225560-2-manuelebner@mailbox.org>
In-Reply-To: <20260421175516.224960-2-manuelebner@mailbox.org>
References: <20260421175516.224960-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 51a9f665fac35a26ff1
X-MBO-RS-META: rpnj9h15ia5335rpzqy4xmqhtniohycm

put the optional argument (gfp) in square brackets

eg. ptr = kmalloc_obj(*ptr, gfp);
 -> ptr = kmalloc_obj(*ptr, [gfp]);

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
+	ptr = kmalloc_obj(*ptr, [gfp]);
+	ptr = kzalloc_obj(*ptr, [gfp]);
+	ptr = kmalloc_objs(*ptr, count, [gfp]);
+	ptr = kzalloc_objs(*ptr, count, [gfp]);
+	ptr = kmalloc_flex(*ptr, flex_member, count, [gfp]);
+	__auto_type ptr = kmalloc_obj(struct foo, [gfp]);
 
 If `ptr->flex_member` is annotated with __counted_by(), the allocation
 will automatically fail if `count` is larger than the maximum
-- 
2.53.0

