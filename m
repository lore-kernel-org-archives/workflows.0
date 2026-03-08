Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CD33B6C4;
	Sun,  8 Mar 2026 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000433; cv=none; b=f24L3Hk1eeXtxbfSBzE7Rp87YFYYo5Yhn+eTF711PSqNYrL6EX9jQwY6MpNbbleUF0pomn7ndXGGokpb4qqeKlIuGUtwwq7J5LKF1Rrq9//dRVesd2d/LE+49viVD/J7fTEMGmi2miv8FQg6oAPl3nnntTNhompOXF8H3XP6W+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000433; c=relaxed/simple;
	bh=MlZuYJqshUy1ZHyLqTdJliuzfXWtREalgh8JNHYmzKk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ugJWNd/7YJY5aUUQjtWmCmpgAnAQvnkKwSh3MHlLNFSTrU8PH2wU288ZWOJy/jZBk70qqzMYvPc56xz7ubsdC1QFAh8VMCw3zQXSLDvGDMX1o1TDnuqc6aPa20TSK2GI2aSg5RtWXI6pdx4vHU1tOF7spqHnlbzWJjybsbEzz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=RkEzPWyj; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="RkEzPWyj"
Message-ID: <55df12ee41de28943298a1e2973d69573edc09f2.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1773000420; bh=MlZuYJqshUy1ZHyLqTdJliuzfXWtREalgh8JNHYmzKk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RkEzPWyjsSdSOwZyvdLFGtVOlEgmnWx+BhlubEfuQCPVpqLk/yF+0lJtL53ei0DHP
	 MyHWrY8y3gPMMNs7GN2eeOx3c9mLXqL0edEDLar5m5z/Tbd4fqabsmwI3ay3BUDCwC
	 iS9kHu1bnZD604l9oqHJ0FUJHSa11QXz4jy0QAvszrHEV5vijyAcFqPX61HxK1TBRD
	 P2Vz+Kf/oedcnxDVHPVkOHUfX6LoldBsGHEUPYhWGAiH+J1LHqiK6VgtVfPBnRZVpn
	 3unZ7LWnbhvdSvqxa8wNmBj2vENNM9O0nLn2+vxmljBzon9Aerg4YV2aPXgtcYFbMX
	 JzFcUX8A7Lceg==
Subject: Re: [PATCH v3 0/2] workflow, scripts: sort changes.rst and ver_linux
From: Manuel <manuelebner@airmail.cc>
To: Jonathan Corbet <corbet@lwn.net>, Collin Funk <collin.funk1@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 08 Mar 2026 21:06:58 +0100
In-Reply-To: <87ldg8af2j.fsf@trenco.lwn.net>
References: <20260302182405.86829-2-manuelebner@airmail.cc>
	 <87wlzsdf3o.fsf@trenco.lwn.net>
	 <8dec205e406364d14f7ddf3ea11695407a7980b4.camel@airmail.cc>
	 <87ldg8af2j.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-03-03 at 12:27 -0700, Jonathan Corbet wrote:
>=20
> > > - Why my request to separate out the logically different changes were
> > > =C2=A0 ignored.
> >=20
> > I split the patch into a series=C2=A0like i responded on Tue, 24 Feb 20=
26
> > 08:13:02=20
> > > > i will make a Patch series with the files split.
> >=20
> > Do you want me to send two patches, which are not in a patch series?
>=20
> No, I want you to separate the logical changes.
>=20
> - Sorting the entries in the list is one logical change.
>=20
> - Adding new items is a different one.=C2=A0 If you mix it in with the so=
rt,
> =C2=A0 nobody can really see which items are new.

so I got that. I have a follow-up question.

should i make two or four patches?

[PATCH 1/2] ver_linux and changes.rst: addition and changes
[PATCH 2/2] ver_linux and changes.rst: sort

[PATCH 1/4] ver_linux: addition and changes
[PATCH 2/4] changes.rst: addition and changes
[PATCH 3/4] ver_linux: sort
[PATCH 4/4] changes.rst sort

Manuel
