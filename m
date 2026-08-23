Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC8B1A6824;
	Sun, 23 Aug 2026 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787498076; cv=none; b=DFoRAKR1a2Gcz+7EIdazvudNekZRYehnnBpUIFXY3760lSKZKQYG1TngvpZPcqLQX1WOgfh2g2HFWz7VxYZhSrpvFzyDZN37im7qJeuBNakRLLi1uZQCCJRqfQYbV8r5Qbj/ztj43yYwKVg0z12lHxOB51v0RdFMSRHAiMltHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787498076; c=relaxed/simple;
	bh=4mNrueOgZzG9MVaUFakS6QjvzaSW7O+rZuxc987IM68=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=gl+FAUJh+CF4Sfp7vdnPoPnpttsHlnELjNNB7OUz11HzJx7bxRaZm+/PepwmvCTSqfTD1MlYcyEay9j2rX+kBSZv+K3peULaY0jRjKwSEJdtWLAOd9sHgiFlL27Ffa+a9LZS4Cr+RGsrPP1zkdXSVZCqLGYskFvdl+A/q0O77iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oRpwdSnJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=O7CTEgIs; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oRpwdSnJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="O7CTEgIs"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hScyp2sSlzKm7R;
	Sun, 23 Aug 2026 17:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787498066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4mNrueOgZzG9MVaUFakS6QjvzaSW7O+rZuxc987IM68=;
	b=oRpwdSnJsjnh3ouwKV6EWuYEXEwIlsZYi1NRdJh0X+bLnhlw2/3THLMzIr541Dfre5tC/p
	qhroop0EElM8BSKNsVkOL6dsIfr2d/gFWtwViNaOVlHgjmcZVFAgFhKHZjwu4u622VKqVM
	F5V0+SJznRlm3dL1KcyQ5SQsGCFFQYA3Vo1Cx6jaamtDAkRvEWwg4lm9fhh5AaTRVMfBtP
	XW6O9IMFaU9eJVXFw7miabsek+UvTII1uOLVvviN+W09gy0VV4qOWw4EX51vsPAZlPZWkl
	H9ygsd9PdAqBW5H2N5IKxrwouT2q6Ap5Sw94ym1LMHL1hNQTSQQYzJD4Tk2Zmg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=O7CTEgIs;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
Message-ID: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787498064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4mNrueOgZzG9MVaUFakS6QjvzaSW7O+rZuxc987IM68=;
	b=O7CTEgIsoFCNLIcqim3/Rxtt8zqFsN/01TgsHe1YJpCg5mERmXRPgedWRDsUbwPGRcse4w
	f3oaeZupxXlRsgs6JaWAyVxfw7M1njsrpVEt+QAzOvLhvPK6OfznlkFCcPMi9zmhf4d+9Z
	F2iHvDAgtKP9Kq1/sh9x7HxxSE+ushgsRI2zoMEqLN2M8nwSr8pVxArlOrXetGJC5tU1ay
	YTggO+K1liFFusVdGI8QGY43pQg/z3jVHUT/mq2TRDOnKIsoX5f3VRbuh1EDm7+vbhCWO0
	BVxwQ7aiiQ4Tjj/Rveqj8YfWiejpVPErJ2MICg+8sLJz7zmxZhxXq9sgM+UbXw==
Subject: [Issue] sphinx: incorrect high-lighting
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>, "open
 list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,  "open
 list:DOCUMENTATION"	 <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>
Date: Sun, 23 Aug 2026 17:14:20 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 557d0fd042a4f61c627
X-MBO-RS-META: jsb55q4u7oxc5ksycbpqbfyuautpi6h6
X-Rspamd-Queue-Id: 4hScyp2sSlzKm7R

I think in the documentation is some incorrect auto high-lighting.

https://docs.kernel.org/process/deprecated.html

Line 272:
> when such a struct was in unions, structs of structs, etc).
with 'struct was' bold.

Line 358:
> alone in a struct or is part of a union. These are disallowed by the C99
with 'struct or' bold as well.

Other files have the same issue:
E.g.: https://docs.kernel.org/process/adding-syscalls.html

Unfortunately I don't know how to fix this.

Thanks
 Manuel
