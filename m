Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C84343204;
	Tue, 23 Dec 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509088; cv=none; b=oDDnZx2wS0aJN/dx51XBLc6pry3AHFGSj/JVgBcJ6YvAFfF+vt9f5T5Q6E+SjmOEgu+MmNVE1dU8ZhQwbqPq54FkJBD7u4Ftabcn7XecYWGYoExONwEeIhUVcQWwojtU1vXUH70ul/H+A76aA+47+pOf74bkqY1HxW2dJAujZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509088; c=relaxed/simple;
	bh=iRfx5sbhKK7mbSnqzuBYfqkPxqmsOVDNyp5shCl4pxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLgIySoob6XRxFNwYotKINmKtA7B+bOcioyVY86cDsp9hHW6K34wGRtVX6/fdYtbbo5yxoypgezGbDpceu3s2/jjjFfY9PqDAy8U69foCZEoyXC5WIAZHHzqxxbdZJCPbZjT4xpDGMrF6OVKVmTqJzlPt+b+BiTf4CM2tsuKoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YRKuSNXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YRKuSNXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57982C116C6;
	Tue, 23 Dec 2025 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766509088;
	bh=iRfx5sbhKK7mbSnqzuBYfqkPxqmsOVDNyp5shCl4pxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRKuSNXzSsbpruPQ/eT0uCA+9Vqsq5rCVWORCFwFf5U6L0M9kcSlrCXccVV8qfREb
	 8clwYGFvoAncUHQSNbaH86ywFUEuV3qtHlEfiHL6zVck25nGlCFxw7VIQz/wcakCpy
	 r/NL6omVbsN+sqvS+I7Bkw0UPGEpcF1fvRoFmduQ=
Date: Tue, 23 Dec 2025 17:55:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kees Cook <kees@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net,
	Shuah Khan <shuah@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <2025122358-flyover-tidy-6f4d@gregkh>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
 <20251115140746.6a3acfd5@batman.local.home>
 <877bvqan70.ffs@tglx>
 <2804290.mvXUDI8C0e@rafael.j.wysocki>
 <EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
 <20251116111732.5159839e@batman.local.home>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251116111732.5159839e@batman.local.home>

On Sun, Nov 16, 2025 at 11:17:32AM -0500, Steven Rostedt wrote:
> On Sun, 16 Nov 2025 07:25:46 -0800
> Kees Cook <kees@kernel.org> wrote:
> 
> > A tag isn't going to capture what we need today. Because the LLM
> > usage is so variable, it'll be, at best, misleading or, at worst,
> > totally inaccurate. I've provided several examples of this where the
> > range of LLM involvement is very low to very high. The prior
> > discussions have shown that we haven't yet found a sensible way for a
> > tag to capture that.
> > 
> > But the common thing everyone appears to agree on is the "show your
> > work" concept that this patch is trying to capture. I think it's
> > likely we'll grow a tag eventually, but it isn't something we
> > understand the context for yet. As a first step, this document is
> > designed to show the foundational goals for what we want documented.
> > 
> > Over some time of applying this, we'll start to see common patterns
> > and repeated descriptions in commit logs. At that point, I think a
> > tag will be warranted. But right now, we don't generally agree about
> > what aspects we want a tag to cover.
> 
> Exactly. My fear was that by adding any new rules (like a tag) will
> steer this conversation into a never ending bikeshed arguments, which
> was exactly what we wanted to avoid.
> 
> Let's have the "tag" conversation at Maintainers Summit and just keep
> this document as something to describe what we do today.

What's the status of this patch?  I don't see it in linux-next, is it
supposed to go through some specific tree?

thanks,

greg k-h
