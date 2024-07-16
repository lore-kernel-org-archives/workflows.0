Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DCF1EA73;
	Tue, 16 Jul 2024 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721149702; cv=none; b=V5jZhEBwtozg4szRb65iy7oQfPMvt/IGO0EdPRJnempjTmj9IJ9Tf/kXmzSkl7zRFdjPF71oLL42NbE9Zsyr6+xu4kUT1Zraavo5fYCpeHah3dky5NF6E6fAs/lzFSDO1gtEIhjV08zvtV+8Lbe6xIUZ1AKbz9s6vGGpIcZ1HPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721149702; c=relaxed/simple;
	bh=1IZ0LxFfpSrfSX4fF+3HezktrqETVbE3RFzYhp6KnE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XQrrgqnPMiTF0Lki6Tjuc+Q1tou1f9P8i+99V8HOtxqW7NE2oWYRkdhEJzMzsDVUYrCPm6LYLL7KPz5DD8OXDdRThdiCQ7ruLY1ZMzOQ+mBNh4mf+au9WiHumWZYRkzRaABeVRYQTewGea4/b33YOlYvlYYxlPciKL7oukvGgcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ii5kWSDM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ii5kWSDM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2A9B3418B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1721149700; bh=pMLrNQUbUzAAJ9qLuz/fLnxffMGzeo8x5u8wY7n5w4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ii5kWSDMC/n3Zgx/Ra6+hxECnS2gVJM6w4HAsSvJC7mr6xGymaJSKJpaOJte+NUZu
	 QPIiVIB1KpSlGb/9dEZw0Qlxcgj9v9iOkuCQplFBtKMzwCTa3iRmUHMxt7VGMI+Rjd
	 X++MpX9RqjyNJQMTxuDaBLMgO91VhO91FBe+Hj8hbhIovLXFN9OW7gI/DRO8RrvXHY
	 Ef2Z/6Ls7kW9QdykkiMkFutGMMmRICP4KdO/Z9u/5b5izh8u4mwXLnyz6xr/Ysk1Mp
	 pYtY/tNelQHhg0Vyu8V+5EM7ajL9Rr9ec21j5vhjh7IJjoQxfSGpa2DoFeaW6ZI2nG
	 nPtJfzdZOG29g==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2A9B3418B2;
	Tue, 16 Jul 2024 17:08:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, mchehab@kernel.org, dan.j.williams@intel.com,
 laurent.pinchart@ideasonboard.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: maintainer: discourage taking conversations
 off-list
In-Reply-To: <20240713235020.820910-1-kuba@kernel.org>
References: <20240713235020.820910-1-kuba@kernel.org>
Date: Tue, 16 Jul 2024 11:08:18 -0600
Message-ID: <87wmlltgcd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> Multiple vendors seem to prefer taking discussions off list, and
> ask contributors to work with them privately rather than just send
> patches to the list. I'd imagine this is because it's hard to fit in
> time for random developers popping up with features to review into
> packed schedule. From what I've seen "work in private" usually means
> someone on the company side will be assigned to handle the interaction,
> possibly months later. In worst case, the person scheduled to help
> the contributor takes over and writes the code themselves.
> This is not how the community is supposed to work.
>
> The discussion on v1 wasn't very conclusive. I am not capable of
> distilling many of the suggestions into meaningful changes.
> I believe the paragraph works in the context of the document.
>
> FWIW the paragraph has been consulted with 2 contributors to whom
> the described situation has happened.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

After pondering on this for a while, I've decided to go ahead and apply
this.  The intent is good; we can always improve the execution if
somebody has a good idea.

I do have to say that all of the "must" language in this document is a
bit off-putting and may well convince potential maintainers that they
don't actually want to play this game.

Thanks,

jon
