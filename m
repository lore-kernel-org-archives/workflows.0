Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76EC12F5A6
	for <workflows@vger.kernel.org>; Mon, 26 Feb 2024 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708975482; cv=none; b=EceGNTn/jHv0i6NRSM1l+bqRp3OB25D3aBiHLdcduO1FnEVkfAAhY4ldw5couni8hAr+0I5B9i5eDaKkojgIvb1vO665SsottQJA6WGyYfN34krg8NH8FHziem42zCiyzqHb5X/CwcJWfGKZ7poF5RUceiIi4yS4KiTIz0n8el0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708975482; c=relaxed/simple;
	bh=J/QJSWCGK+M8Ej29OsDNUzUzOv0KPhglEy6Xt99owBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEdJO9ABrfgIfYJiahv8UUJmUz96OKFMOGrKUMpqDj5AXNTDtXfN/VCZnw15VxkUeDwBHdqpaBEG8tyL2DNqsP6GyzpPY8iCMac804HDtKJqpK5n5n+IHeYZwHaD1J9k6iHc53iCObNxIKi+r5/Um6Y12VJhS72bBgZ15iLKZrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hxiyfQkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hxiyfQkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1764FC433C7;
	Mon, 26 Feb 2024 19:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708975482;
	bh=J/QJSWCGK+M8Ej29OsDNUzUzOv0KPhglEy6Xt99owBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxiyfQkf69apORDGFaIJBzNAFp1dZzWiJH4LoWridpKo7N8onDRwbTlT4v3UPtbCd
	 dCyuztO6g9O4dZ2vFlxsj0fEuB4jaHzQ4DMFmc3icNquatyQrT/KAJ43HnGVBkX/UR
	 1Oh56Xw/UFiUwRU9a38Ih+gXZUSgXm1YYFZT8J2Y=
Date: Mon, 26 Feb 2024 14:24:39 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: workflows@vger.kernel.org, corbet@lwn.net, ast@kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
Message-ID: <20240226-gainful-dark-snake-c15cf8@meerkat>
References: <20240223083154.4fbee63c@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240223083154.4fbee63c@kernel.org>

On Fri, Feb 23, 2024 at 08:31:54AM -0800, Jakub Kicinski wrote:
> Hi!
> 
> We have a few netdev-related bots with various simple status pages.
> I hooked them up to analytics recently, here's the dash:
> https://plausible.io/netdev.bots.linux.dev
> 
> Plausible was described here: https://lwn.net/Articles/822568/
> it's supposedly-open, and privacy-focused, no cookies etc.
> 
> It's useful for me when deciding where to invest my time,
> and to back up the efforts to my employer with some data.
> 
> Now, most of us agree that kernel docs leave something to be desired.
> At the same time maintainers are repeatedly faced with people who post
> code without reading the docs, which puts the time invested in writing
> them into question. I can't help but think that providing some
> analytics for docs.kernel.org traffic would be beneficial. 
> I would use it.
> 
> Thoughts?
> 
> Does anyone think that even non-intrusive analytics are a no go?

In general, my previous experience enabling libravatar on git.kernel.org has
taught me that many very vocal people *really* don't like to have any kind of
statistics gathered about them. However, if it's just for docs.kernel.org,
then I don't think I have specific objections.

That said, I would need help turning this on -- if someone can pass me along a
Sphinx configuration option that I can enable during build time, then I'll be
happy to add it to our build jobs.

-K
