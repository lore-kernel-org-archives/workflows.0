Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A7B12FF76;
	Mon, 26 Feb 2024 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708977533; cv=none; b=jNOVVbOxGl72II1P44j2xrSdQ/lU16U1Qs7coIrY2nXNOaSsjnXBWQGhcKawCuQFNAN572PVbkTHKqxGl84NmBKX/6yhiZxm/7DnaK5Uf2NJowah5kFoRiVe8Jj7bvli/T8WlYHBJ71l2bQ5J7Ailmu1bdmg+0FqoCd2yVCnC4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708977533; c=relaxed/simple;
	bh=J80zQU07FSspPWWiRs0xE607Ig+6bSYSsWHfJYKiOpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AkZHLJ+fy0jqwMoIb1qUGQk7wR2+WoinPWiJkaICuz19azULlhcEV9JRjuvov3vBsoMUiZmBYiM43jm61oiLe0+m7JbqmIpQJr/Dgwo/0n4bYW0q5b3kqihrj7LnMDSZNRCVTjoCKQiSpuba+ib6QL5XkCsKzkwdhwC143hpJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NQCyoXNn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NQCyoXNn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BBFD545FE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708977523; bh=m4O5imEpLFfv6zg5pUYqLzWSwl/eO74CL0WZxd/JRHI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NQCyoXNnV7vFRLErwLeKPu2KxDu3WsvuAE8wEpNkX9useo5m2+lB/lyfhHr5gt3wY
	 y7VRcqAVwwARfVHEKSIs7WCzCW8mTagL8oCCZLDuKKcVt/bHsjk9WagoOa4nVKpqLq
	 FrxMAU7aJz4o+hsXvbbVjq/twhRSjEvbpbpp7gjHaJRZdQe6ybF2JWvd9UJEH/LPvM
	 9BbQeNAD/dr7+cNo0vL81EDOYio6/U19Nd44pnVzCl3R3UdL/ZYzi6SbxzkckeX912
	 pDjkSRT1YSye60uHs+8tXVmMBs9p61kP2EM6U4vOjNBXnmMY7Yebk8tVmKTEDLi6j4
	 a+K6myDGyKB9A==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BBFD545FE9;
	Mon, 26 Feb 2024 19:58:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jakub Kicinski <kuba@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, ast@kernel.org, linux-doc@vger.kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
In-Reply-To: <20240226114350.215be672@kernel.org>
References: <20240223083154.4fbee63c@kernel.org>
 <20240226-gainful-dark-snake-c15cf8@meerkat>
 <20240226114350.215be672@kernel.org>
Date: Mon, 26 Feb 2024 12:58:43 -0700
Message-ID: <875xyb2e18.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> On Mon, 26 Feb 2024 14:24:39 -0500 Konstantin Ryabitsev wrote:
>> In general, my previous experience enabling libravatar on git.kernel.org has
>> taught me that many very vocal people *really* don't like to have any kind of
>> statistics gathered about them. However, if it's just for docs.kernel.org,
>> then I don't think I have specific objections.
>> 
>> That said, I would need help turning this on -- if someone can pass me along a
>> Sphinx configuration option that I can enable during build time, then I'll be
>> happy to add it to our build jobs.
>
> Excellent :)
>
> Let me CC linux-doc in case someone can tell us how to hook things in.

It's probably not just a configuration option.  I suspect that this will
need to be done either by editing the templates or with a little
extension.  Either could require adding this support to the kernel repo,
which might raise some eyebrows.

jon
