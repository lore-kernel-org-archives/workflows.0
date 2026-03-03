Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4639656D;
	Tue,  3 Mar 2026 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566071; cv=none; b=F8NNPMIeDLohK1jSPa66WBsHNa/3cL0vj6AppQMNFjI6pPiT2ZCFXLOhx1n3x3Qy3lHwlRl6P51cDc1QrtKyjbwYySJo85SBO4xa23BaoPffGapVj8Z1Jr3g70kja9PlzyzrAyF8jnkyk9aIxJlv9QBq/gmt14XfeeOu/T/h7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566071; c=relaxed/simple;
	bh=Dsqi1wE3Ym5QNKhtzxtJFt9zUAfqyXOdRITFfxKfo7o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V3OexHPmPTLg9RGPWoDXy5Y2erJ/iNu46LTwPbTN5Pcq3SRhpz2bBCQDeHE0VK9+zPzoWNrwnMhWPBK5XvcD2zIWhSX1k9RV7LM0q726gvVUZFDuhOtpTk4pz1IlBF6TokSYSB92VBeBWNrT0P2wOXAaeALD8b4/lWmIkORdLT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MXkg45rK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MXkg45rK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 59500411CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772566069; bh=CNglGzpcfdJvIrcxYFBRcyIZHbBYDSI52NDm5FAmAGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MXkg45rKGiTGlnwpm1dBKiLnGVOAzgnMi+d3g9b+4RMkVgjiTt6Ml0HAU+rAdeAEd
	 b+WPhOW5lQo3uUwrPWtydYFcq/za9Qavah2d0V6+gRM2XLem3mXHPyA++Si4y764NE
	 +FhO1tpgpu+v22gVdOQOxFDzPA6BEHjn5iDommc+wNQoJX1dq62g4/plY/LWioNqpT
	 5Vw2Mg0tWPDDcBqGdXTOYRI+deQUBIuEMKtcR44wgMGz1ir1nnoTj0gw5sxmkwoO/I
	 HYGQlDLy9tQ/XjwcJTTgVuvQQIHtZ9EYn87Zs5RLygyowigiCiOq7B4Le0CZR43vqe
	 7lIXYxma8Cu1A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 59500411CF;
	Tue,  3 Mar 2026 19:27:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel <manuelebner@airmail.cc>, Collin Funk <collin.funk1@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] workflow, scripts: sort changes.rst and ver_linux
In-Reply-To: <8dec205e406364d14f7ddf3ea11695407a7980b4.camel@airmail.cc>
References: <20260302182405.86829-2-manuelebner@airmail.cc>
 <87wlzsdf3o.fsf@trenco.lwn.net>
 <8dec205e406364d14f7ddf3ea11695407a7980b4.camel@airmail.cc>
Date: Tue, 03 Mar 2026 12:27:48 -0700
Message-ID: <87ldg8af2j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manuel <manuelebner@airmail.cc> writes:

>> - Why I'm getting the same series from a completely different identity;
>> =C2=A0 the first set came from "Hans Anda"
>
> I messed this up, let me explain:
> I used to keep my real name out of the internet. The last couple days i c=
hanged
> my mind. I guess it's ok when my real name shows up in git blame.
> I really should have added a note about that. sorry.

So you sent me patches under a false name?  That's ... not the best way
to start building trust.

>> - Why my request to separate out the logically different changes were
>> =C2=A0 ignored.
>
> I split the patch into a series=C2=A0like i responded on Tue, 24 Feb 2026=
 08:13:02=20
>>>i will make a Patch series with the files split.
>
> Do you want me to send two patches, which are not in a patch series?

No, I want you to separate the logical changes.

- Sorting the entries in the list is one logical change.

- Adding new items is a different one.  If you mix it in with the sort,
  nobody can really see which items are new.

See what I'm getting at?

jon
