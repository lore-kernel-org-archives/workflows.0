Received: from mail61.out.titan.email (mail61.out.titan.email [44.210.205.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E928469F
	for <workflows@vger.kernel.org>; Fri,  6 Feb 2026 20:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.210.205.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770411582; cv=none; b=uaVXL6XqWRmcUq6tAbAltDeF0JBar1Xs8Od5TTJuPWBT71KaytM94POMEzNROriaePitF7oiCQ0uKkTvge4ChJ4M2gttfT9oDcpxqEUGI6mCCgHtVM5eS1edfGakD5UDIh11F7hfu+vjVGnTJWR4OIJy/hNfbQM98K7d11Xn79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770411582; c=relaxed/simple;
	bh=bt+q4UN7M4UPWoztDj4BqQZjEi0pw9NEFJkZigzU/HU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OiSWA6WBi8zjcvkAd2tmpOsVVrKl0QpFJ7Js5Sxx5db5TRSNTj5H2c0/PdZKURicYJau0lwAiK+Z9ggs4u52xDDkGjOX8SGmLyEhlr/Vtaf/XN309uyscWyIQJrxC/jRPlZFbdDKnShB9zdF1e9BTnLxs7SQhvl5yL5OuhjLF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=kA/FcTRh; arc=none smtp.client-ip=44.210.205.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="kA/FcTRh"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f75f558LMz9rvX;
	Fri,  6 Feb 2026 20:43:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=bt+q4UN7M4UPWoztDj4BqQZjEi0pw9NEFJkZigzU/HU=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=subject:from:references:in-reply-to:date:to:mime-version:cc:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1770410621; v=1;
	b=kA/FcTRhQ8mJ1QouG62VRuhqmXwMT4mF8YD29+/DYExhzr3hRrqzgqryqQ9boaoOSGyAd7qq
	WXVUM0rA/sPKKk/I8iKso6OfRVnL+VkRx+Ku3kQpcSvrYP2XZ26DDqSPmvNDZrE5j2xaVXc4cII
	m1ZsdZFYQIulmlHyHvl/UoEU=
Received: from smtpclient.apple (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f75f34tsYz9rwv;
	Fri,  6 Feb 2026 20:43:39 +0000 (UTC)
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
In-Reply-To: <87fr7deu3o.fsf@trenco.lwn.net>
Date: Sat, 7 Feb 2026 02:13:23 +0530
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAC60EB9-401A-4FC2-8328-6A8B9D152296@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <95e18b9f-1426-44cd-a5f1-fca5bd122450@app.fastmail.com>
 <87fr7deu3o.fsf@trenco.lwn.net>
To: Jonathan Corbet <corbet@lwn.net>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770410621542194099.13754.2441553880501970526@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=fsImZE4f c=1 sm=1 tr=0 ts=6986527d
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10 a=CEWIc4RMnpUA:10 a=07d9gI8wAAAA:8
	a=ag1SF4gXAAAA:8 a=a_CdG123no7xztqTXtwA:9 a=QEXdDO2ut3YA:10
	a=e2CUPOnPG4QKp8I52DXD:22 a=Yupwre4RP9_Eg_Bd0iYG:22

Hi Jon,

Hope my patch gets accepted for commit.


> On 6 Feb 2026, at 9:34=E2=80=AFPM, Jonathan Corbet <corbet@lwn.net> =
wrote:
>=20
> "Konstantin Ryabitsev" <mricon@kernel.org> writes:
>=20
>> On Thu, Feb 5, 2026, at 06:55, Amitabh Srivastava wrote:
>>> Update http link to the documentation about how to add a kernel.org =
UID to
>>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>>> checkpatch warning.
>>=20
>> No objections from me, but please check with other reviewers if they =
want another revision.
>>=20
>> Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>=20
> I think we've probably done enough rounds on this one :)
>=20
> Thanks,
>=20
> Jon

Regards
Amitabh

