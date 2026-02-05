Received: from mail87.out.titan.email (mail87.out.titan.email [209.209.25.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025CC42189F
	for <workflows@vger.kernel.org>; Thu,  5 Feb 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.209.25.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304572; cv=none; b=P/l/B3TwiSZY/7h3wJRua2iRloUx9kWQO0xBIKfLz5m6XiNKRn2PwHuHWl+pCHVu1mjyEvrDOUM7GA2e5LOdslBofNJMTYVBea/m+Ep8ETU2de2bf2YrfmRLFIqfityr2kPCsFEigITreIXp+t10+lsUkDlEzRdQNeF8X0GZZPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304572; c=relaxed/simple;
	bh=Em0IBnAOKvbdhP2ZXM2M6eN7Om6BVNz94TgdbHVkrS8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jdsPEMtL7JDqfENLYkUmAs4MnUB2VWXhP2OpzFWxnldWOd1N5A/3aQHN9XzrI8e0nl/rCMrSxMBqb5A2KQ2AKhxprUzztx2trqVLrmCRaOTSqRiIj089tg7kndgGQrwd4XOIHt3fjMHR0fNYqCxB+oing7LyOYf3raVo7UpODFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=FNZEwJrT; arc=none smtp.client-ip=209.209.25.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="FNZEwJrT"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f6LQf24KQz2xHM;
	Thu,  5 Feb 2026 15:16:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=EaTGnSttgAmRUuLl3/CSvDufPhbXTdqsDt2/0s/ZsR8=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=mime-version:in-reply-to:cc:message-id:to:from:subject:date:references:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1770304570; v=1;
	b=FNZEwJrTmG7L1jfaaO8PenrDhXSeHZPHMYdZ0/tlyu/Ypx14Q1RO0kAcs8P6pqugfzZM+JMe
	9AzQ5WlH/Adf8LDL+s+Z1+/bp5td2qiWAvLv25O1Fzi6zpG7XEc0zb+g9fOQIwdX8O+u7nd1Yw6
	VIYnM8gxLKGbWtFN38R+Blrc=
Received: from smtpclient.apple (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f6LQc418vz2xDp;
	Thu,  5 Feb 2026 15:16:08 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update kernel.org
 docs link
Feedback-ID: :amitabh@amidevlab.com:amidevlab.com:flockmailId
From: Amitabh <amitabh@amidevlab.com>
In-Reply-To: <875x8bi6su.fsf@trenco.lwn.net>
Date: Thu, 5 Feb 2026 20:45:52 +0530
Cc: workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <875x8bi6su.fsf@trenco.lwn.net>
To: Jonathan Corbet <corbet@lwn.net>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770304570131689093.28339.5113251852896558738@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=FPHhx/os c=1 sm=1 tr=0 ts=6984b43a
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10 a=CEWIc4RMnpUA:10 a=07d9gI8wAAAA:8
	a=4yxl8aT0AAAA:8 a=np37udmmvbIGcRCE1RQA:9 a=QEXdDO2ut3YA:10
	a=e2CUPOnPG4QKp8I52DXD:22 a=oCAeEeOuyiZLRzIZmmpZ:22

Hi Jon,

> On 5 Feb 2026, at 8:19=E2=80=AFPM, Jonathan Corbet <corbet@lwn.net> =
wrote:
>=20
> Amitabh Srivastava <amitabh@amidevlab.com> writes:
>=20
>> Update http link to the documentation about how to add a kernel.org =
UID to
>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>> checkpatch warning.
>>=20
>> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
>> ---
>> Documentation/process/maintainer-pgp-guide.rst | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/Documentation/process/maintainer-pgp-guide.rst =
b/Documentation/process/maintainer-pgp-guide.rst
>> index b6919bf606c3..1e4d885dc784 100644
>> --- a/Documentation/process/maintainer-pgp-guide.rst
>> +++ b/Documentation/process/maintainer-pgp-guide.rst
>> @@ -1,3 +1,5 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>=20
> Do you know that was the intended license for this file?  We need to =
be
> careful about putting license declarations on other people's work.
>=20
Yes, The Linux kernel documentation is typically licensed under GPL-2.0.
Other files in the directory contain the same 'SPDX-License-Identifier' =
as well.
However, I have added this just to satisfy checkpatch.pl requirement, =
which
checks for missing license information in documentation files. Let me =
know if
you think otherwise.

> Thanks,
>=20
> jon

