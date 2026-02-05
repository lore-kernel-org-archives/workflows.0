Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090AF423156;
	Thu,  5 Feb 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770305406; cv=none; b=NAjz5WIUz135DwKN+RLE+qo2OnzzL5tOnba7JbCNVzg9f/t1yIZHg0GS/CT5JFuwzGs8DUeveQEKKXOVfEJ5jJWQ3XlcacCYPXIxywC+qZLr5b5MFSK7DnP0Uqm9UWA1hwSj0GwE1RTr2DZid+mAcdHNc+ValUFw7mkHwU1QgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770305406; c=relaxed/simple;
	bh=fZ2xlxnXLiw/h5Vlzzv1Q/V+SjQSkj17RTsLJRoAuU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uHbZJ3fMpyAfAZQS08s6wujQ3aALhv6HgIaud+lKPJ2y9LFTK1rys0noPl4LgjPPgzGHoZZ1dsCarACJx5rSpssFfzJwYv8rPi7fZcDq+u6MGYPCQDxmLuQd48IbCCQ6D+4Y5xbesyr8G7QcZXldAVSPQYJjbIJfm28LH+7x890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jT9lmIiS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jT9lmIiS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2D2F940423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770305405; bh=wn/A4B0zgT1iPFcsMuZLEzI5PhZCTF66+607UcUmVvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jT9lmIiScm/1YC82RwKYOP9RvOi7plkZyz51r617RrgrPNgDFRFLAYTJ70c93G7Rf
	 11B5dLbg+P8zi/t4dCo8maI+AV6fA0c3210dmzkDSNTUqmNEHIJVegjINAaR4VA0Mp
	 t+dLgdoqS3hdsvqQZiNVAFMIGgpqWjM0PCiNjWWBepp/8E/Lg+POlDrMJh9oKGg9rj
	 zTXQ/wtQZ43sZaPHNX3AL+lAG3BQuvJHFvcWABMXsm82aKkgHBzGqFh3HoIxysPtAq
	 p+i34MvvZ5EHvV5HwkhRJBEQiS3GoY1464n2+MwW1MiS3hNOhw18NX9k7JlEuKaRKF
	 +rWQxSh+CXv6g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2D2F940423;
	Thu,  5 Feb 2026 15:30:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amitabh <amitabh@amidevlab.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
In-Reply-To: <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <875x8bi6su.fsf@trenco.lwn.net>
 <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
Date: Thu, 05 Feb 2026 08:30:04 -0700
Message-ID: <87sebfgqdf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Amitabh <amitabh@amidevlab.com> writes:

> Hi Jon,
>
>> On 5 Feb 2026, at 8:19=E2=80=AFPM, Jonathan Corbet <corbet@lwn.net> wrot=
e:
>>=20
>> Amitabh Srivastava <amitabh@amidevlab.com> writes:
>>=20
>>> Update http link to the documentation about how to add a kernel.org UID=
 to
>>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>>> checkpatch warning.
>>>=20
>>> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
>>> ---
>>> Documentation/process/maintainer-pgp-guide.rst | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documenta=
tion/process/maintainer-pgp-guide.rst
>>> index b6919bf606c3..1e4d885dc784 100644
>>> --- a/Documentation/process/maintainer-pgp-guide.rst
>>> +++ b/Documentation/process/maintainer-pgp-guide.rst
>>> @@ -1,3 +1,5 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>=20
>> Do you know that was the intended license for this file?  We need to be
>> careful about putting license declarations on other people's work.
>>=20
> Yes, The Linux kernel documentation is typically licensed under GPL-2.0.

I am aware of kernel documentation practices :)  "Typically licensed"
does not tell you what any individual contributor intended, though.
*Probably* that tag is OK, but you should really consult with the
original author of that page to ask what their intent was.

> Other files in the directory contain the same 'SPDX-License-Identifier' a=
s well.
> However, I have added this just to satisfy checkpatch.pl requirement, whi=
ch
> checks for missing license information in documentation files. Let me kno=
w if
> you think otherwise.

Checkpatch makes suggestions, not requirements.  All files in the kernel
should have SPDX lines, but they need to be the correct ones, not just
somebody's guess.

Thanks,

jon
