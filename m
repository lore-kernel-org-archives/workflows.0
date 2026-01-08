Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08473A6414;
	Thu,  8 Jan 2026 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879718; cv=none; b=U3tQR63gsEcPyxUOGOyhE5J1h3zpo2MBsHctt9AbjtEOkbub7giMbgKTNOjEqgBwNSjYlxyAb6KyckqW4xVcIgjokFRKLRNmcIV2G/uQ+koCAOlRLKtYlyC0XzWy6IIokKgDHz7TuJPfRYdGIa95q45NiM+UCjvMy68NtD8Luj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879718; c=relaxed/simple;
	bh=XZ4kzl9jQGhD8KF80M1FWnEADkBaGG+DfLDNU2Zahac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfwABDEF0fY+tMBVJ4zgdCzuSh5Ivczc1hYfgwyw6ptieFYmn+yCSEzT3NTJqLyYp0vmiYQmDU+eYr8P6yapCIm0etKilFQafVf4lRREYClrJuPPeksd+VXng4/VrRJSf09qWm65757GKEy6YpCTPxmeaQfegEJqk9Kx1XLva5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bsWuBO5e; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bsWuBO5e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8xxFFZ56Lyoh99MpLvmn9V6ZFtdBTbeFia4HP1Wct5M=; b=bsWuBO5eu0lpMIDjXjged+T4Vf
	FaYjzC8Q9YrRs4g2AG6vG7QKnNpHiYIboyrN13aeYY2xPwnQRSKLTnra5arJpzFK07fWEPO0k7ld5
	zp9jZsbc2JaitKzXskZuCAqZAPpvNkKym1JJeFfjx76ZpoITz5RsUnyGooYrFVl49jKY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdqGO-001xEg-RN; Thu, 08 Jan 2026 14:41:20 +0100
Date: Thu, 8 Jan 2026 14:41:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <c04c84a0-c38d-46e3-907d-e32191cfc9f8@lunn.ch>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>

> And it's not like I'm asking for much, I'm not asking you to rewrite the
> document, or take an entirely different approach, I'm just saying that we
> should highlight that :
> 
> 1. LLMs _allow you to send patches end-to-end without expertise_.

As somebody who reviews a lot of networking patches, i already see
lots of human generated patches without expertise. So LLM might
increase the volume of such patches, but the concept itself is not
new, and does not require LLMs.
 
> 2. As a result, even though the community (rightly) strongly disapproves of
>    blanket dismissals of series, if we suspect AI slop [I think it's useful
>    to actually use that term], maintains can reject it out of hand.

And i do blanket dismiss all but one such patch from an author, and i
try to teach that author how to get that one patch into shape, in the
hope you can learn the processes and apply it to their other
patches. Sometimes the effort works, and you get a new developers
joining the community, sometimes it is a lost cause, and they go away
after having their patches repeatedly rejected.

So i don't think using LLMs makes a difference here. I've seen the
same issue with blindly fixing checkpatch warning, sparse warning,
other static analysis tool warnings. I just see LLMs are another such
tool.

> Point 2 is absolutely a new thing in my view.

And i would disagree with this statement, it is not new, it already
happens.

	Andrew
