Received: from mail97.out.titan.email (mail97.out.titan.email [3.219.11.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAD78F39
	for <workflows@vger.kernel.org>; Thu,  5 Feb 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.219.11.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770300863; cv=none; b=qkSy/Fh37os+r4FX1ufPGM8VYomsie5HycNMokq/PI5nm7+BcMrKo2sIyAzMDbMTeyHj8I4BzbR4HeQv1z/7ORChxnbA+QFkaX2eEX8xuIKXAQGfd4/CIR9lLoWm4awpG5uN8WRQg5REa4jHmNXdnSFIvd4z7oSgeXWljZseBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770300863; c=relaxed/simple;
	bh=FFkpM42UXIxkI5Nwmv9y+uhPbRXJWnNl3wRPQnm452o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Vwh+6YQmOaek96/TH9V/hXT4N01pg0QGff27Isa/eaogrJ/5szDFx7j7XQel0Y58nFRM1Q1jW3jpclgLEF5mHW7BNhteroRxWnB979vU8OxVuX/3TgjZE2qSm/ZBIzBze+96FUSuAx6lpcshH7sO0anh2wqQnc2nVmSdBeQil0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=l4GTal8p; arc=none smtp.client-ip=3.219.11.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="l4GTal8p"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f6K3K2hcGz9s24;
	Thu,  5 Feb 2026 14:14:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=JUtYKuQE1F5FBDB9QgY0zbKHLcBV6ijN7dYr4Dbvhio=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=mime-version:subject:in-reply-to:message-id:references:to:from:date:cc:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1770300861; v=1;
	b=l4GTal8pS1vguX7e6DnmAsHavGrlXjYXNmEqHBjjOpFhN685x/MNmC6itha/bvyPDxoDvDaI
	3DX/2gRmcx0Rsall98THRTWLgixDEgi5GQN5EiZfgX0ozFc4urNgO3cjAC/QfM8K/CIa5tD5erA
	fUroBOHYjI5OuVzgWuDJ+rKU=
Received: from smtpclient.apple (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f6K3H2Mtpz9rxY;
	Thu,  5 Feb 2026 14:14:18 +0000 (UTC)
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
In-Reply-To: <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
Date: Thu, 5 Feb 2026 19:44:05 +0530
Cc: corbet@lwn.net,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <208E3D71-B2A9-4428-958F-915E6FC95D4F@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770300861187473581.13754.8931835535389347760@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=aI4Kqa9m c=1 sm=1 tr=0 ts=6984a5bd
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10 a=CEWIc4RMnpUA:10 a=tBb2bbeoAAAA:8
	a=4yxl8aT0AAAA:8 a=i4OmGAD0xVQIe_X6LU4A:9 a=QEXdDO2ut3YA:10
	a=4a-YG245BeQA:10 a=Oj-tNtZlA1e06AYgeCfH:22 a=oCAeEeOuyiZLRzIZmmpZ:22

Hi Geert,

Hope this clarifies.

> On 5 Feb 2026, at 6:53=E2=80=AFPM, Geert Uytterhoeven =
<geert@linux-m68k.org> wrote:
>=20
> Hi Amitabh,
>=20
> Thanks for your patch!
>=20
> On Thu, 5 Feb 2026 at 13:09, Amitabh Srivastava =
<amitabh@amidevlab.com> wrote:
>> Update http link to the documentation about how to add a kernel.org =
UID to
>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>> checkpatch warning.
>=20
> > The first sentence states the obvious, but does not explain the
> > rationale behind this change.  Why should it be changed?  Both the
> > old and the new URL work.

> The old URL no longer points to the correct page having mentioned =
information.
> [Old URL]: Simply redirects to 'https://korg.docs.kernel.org/', which =
doesn't have any information on how to add the kernel.org UID to your =
PGP key.
> [New URL]: Precisely opens the respective page at the anchor for the =
respective section 'Adding a kernel.org UID to your PGP key'.

>> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
>=20
>> --- a/Documentation/process/maintainer-pgp-guide.rst
>> +++ b/Documentation/process/maintainer-pgp-guide.rst
>> @@ -1,3 +1,5 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> .. _pgpguide:
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> @@ -864,7 +866,7 @@ don't already have them)::
>> If you have a kernel.org account, then you should `add the kernel.org
>> UID to your key`_ to make WKD more useful to other kernel developers.
>>=20
>> -.. _`add the kernel.org UID to your key`: =
https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_p=
gp_key
>> +.. _`add the kernel.org UID to your key`: =
https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp=
-key
>>=20
>> Web of Trust (WOT) vs. Trust on First Use (TOFU)
>> ------------------------------------------------
>=20
> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- =
geert@linux-m68k.org
>=20
> In personal conversations with technical people, I call myself a =
hacker. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus TorvaldsThanks

> Regards

> Amitabh
