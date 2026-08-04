Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5D40E8E6;
	Tue,  4 Aug 2026 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857723; cv=none; b=AX4UVQ3Joaiz2ah4WnoRcwp/V6kb5cA3bg8QoNKeF5tLC2icHl2Zgr4NEj1hO8bR3/RwPgC0TEi7bKgw88lsWHgvNgr6hrU6a8vp1+6IGoeX2Dx0q8dFEB6KBXI4WSLiRgEGC8T0++0AhysjnY8SbbmqX3lxCUkfeq8Or6kyLXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857723; c=relaxed/simple;
	bh=2QjdwwT+U7TV5vBagKEKQHGDQSHasp6xQROb5+bbnl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gyj+Fegmca6F9OQijdYBUVmeZ29RUCsaOpWzD2jciZSVkWaRxPRYn6RTYI5BPWQxmH6wiIcpzY6BmMcCsoP1v6H/BpeXiSSHp7fjJnD2dfjycyLBfOQ5u33+6yDSKihFhnAhVtObaFd1wD6rPZsY0BGOTuWqM5lkB1AcmTxZIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fLM7BHK5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fLM7BHK5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C10C9408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785857720; bh=/ZyFDrPg7FY7jyYlSgTlOrSNcgUPXvp/acBGEv1g4Rk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fLM7BHK5p3j7Jsfx5r/QjA7TxoJK1/dCZ/gpEk6zajrM0w7EH2pHpYSpls78SzzXW
	 LZs9TiJrle13DsRZZN96/sj2jbwd3SWlyIm2mN3z33rw9Y/7ofTMAJE8Vcz+Y+WFCf
	 jq92OoYz0VxjpxDR3Y/UJ1Zu0sISPNgrnMk7GFph54wUUpkZ6Nh0KY52XvC+Y/bmCr
	 N9tIk/pgmAsmGFEtsV3zw6+G/RS3NH0gwLNiIcxPNrrWpGSBifSFHUIlrA+DpoPgp6
	 l408QqnVOaatvorF4UJ0QZN08IjDtRRQd+PmbtCLeWlWZXJEeUOLWFgw6NDHpFVzg+
	 4d4w/YButcpmA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C10C9408B2;
	Tue,  4 Aug 2026 15:35:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
 Sasha Levin <sashal@kernel.org>, tech-board@groups.linuxfoundation.org,
 Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org
Subject: Re: [PATCH] coding-assistants: simplify attribution
In-Reply-To: <ced405b4c1f2459df4885dc8ed1cd122f7c88fb8.camel@kernel.org>
References: <87qzkuahlr.fsf@trenco.lwn.net>
 <ced405b4c1f2459df4885dc8ed1cd122f7c88fb8.camel@kernel.org>
Date: Tue, 04 Aug 2026 09:35:19 -0600
Message-ID: <87wlu5uceg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jeff Layton <jlayton@kernel.org> writes:

> One thing that needs to be changed in conjunction with this is
> checkpatch.pl. When I try to use the new format, I get:
>
> =E2=97=8F a9b9b7e55379: btrfs: pre-allocate delayed dir index for non-ove=
rwrite rename
>   =E2=97=8F checkpatch.pl: :2036: WARNING: Assisted-by expects 'AGENT_NAM=
E:MODEL_VERSION [TOOL1] [TOOL2]' format
>
> This patch fixes it for me, but I'm not sure it's restrictive enough.
> Jon, feel free to fold this into the Documentation patch, or I can send
> it separately if this seems right.

I'd say send it separately, probably with a copy to Joe Perches...

Thanks,

jon

