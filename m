Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F653CEBBC;
	Mon, 23 Mar 2026 18:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290503; cv=none; b=mafnnl6H0xGOuYRaK+CMr3Bor14ubo3CBFBfZ4LqeQe4t6QQMD2ygC6qarNoXDoOeuFb3euIgbby6aZZJT4cuIGAeT4qmxI1qkDCxsQYl7I50WFiPGu4meMqFzMqIG+iPltEFZ9yn0023pkHXefZPMVuu73U9quvjUrI9V8BcxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290503; c=relaxed/simple;
	bh=MMPUviqud8a31n73i7qpGLdmIdv1bU9kYPKopS/FQg0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RVIX44J/skeAzMKtB92rAi/IbgqpcDB2GNavMBwtZIVdsrBBr2JDJ7Kqb+JTG9l/kCvSFoqSne9lqNpge78LcLszim8lCCNnuxxNVWEh3X6W1XDWOkWFnwoxWvENI4O0jsSC/l3wubVQ+QiP7T9yYi4u9DGFEEgh+iyN2o9Xgxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eisW0owj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eisW0owj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 05E004121A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774290495; bh=T3Ct6/F8GmUsi5m+MmETnDOR90NUeHSD5/sGbdvfVv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eisW0owjYlgRRjL1zOfrlzcFcKlADtxEuF3lk0nJvqwKktCpk12XRGmn6S2wWjhrX
	 2ziw5JSeltNgcLZm7jibk0/7uUTF1PNKwq8H5kdl0rhEtVpzooiLCdORQlcwAVnfvj
	 OvG8hM80rXmwXtX8tz1W1W1lcCe1kVmhLyn4YJK3t3EQLs/s/5b5sghnz5O9gaPn4s
	 eEM+gJEWE/8KQSF5N0j22UgGN5HSzDwtZjOyy9qYeiq0U25JCKMTugJoJTP9CU9Pf1
	 IuS/dwJDjpMWEt4PlUhorMoIaxDxuKFhcCPfCklkHQ5v0I6mjC0UUqgaHb/8IcFSnM
	 wgCAx3ldy1lVA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 05E004121A;
	Mon, 23 Mar 2026 18:28:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] workflow: process/changes.rst: expand and
 cleanup list
In-Reply-To: <21f66cb8aa8e3ede1666bec65540824784041aa3.camel@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
 <20260311165612.184288-2-manuelebner@airmail.cc>
 <87fr5ycxao.fsf@trenco.lwn.net>
 <21f66cb8aa8e3ede1666bec65540824784041aa3.camel@airmail.cc>
Date: Mon, 23 Mar 2026 12:28:14 -0600
Message-ID: <87tsu69z9d.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manuel Ebner <manuelebner@airmail.cc> writes:

> On Tue, 2026-03-17 at 09:04 -0600, Jonathan Corbet wrote:
>> Manuel Ebner <manuelebner@airmail.cc> writes:
>> > remove footnote for sphinx
>> > =C2=A0in the paragraph before the list it says:
>> > =C2=A0"Also, not all tools are necessary on all systems;
>> > =C2=A0obviously, if you don't have any PC Card hardware, for example,
>> > =C2=A0you probably needn't concern yourself with pcmciautils."
>
> i understand this paragraph like this:
> most or all tools can be optional, depending on the specific use case.
> e.g. quota-tools is optional for people compiling the kernel.
> that's why i removed the optional markings.
>
> and pcmciautils, the example in the the file, is not marked as optional i=
n changes.rst:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>         Program        Minimal version       Command to check the version
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [...]
> pcmciautils            004              pccardctl -V

The markings can certainly be done in a more thoughtful way; I don't see
that as an argument for simply removing them, though.

>> > remove "(optional)" for the same reason as above
>>=20
>> Here you have lost some information - now the document doesn't say
>> *which* tools are optional.=C2=A0 That is, I think, not ideal.
>
> that's true.
> my question is: what are the tools optional for?
> or what is the criteria for "optional"?

Well, that would be an awfully nice addition to the documentation, but I
wouldn't require that to get your current changes in :)

Thanks,

jon
