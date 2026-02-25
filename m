Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8603783AB;
	Wed, 25 Feb 2026 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063197; cv=none; b=LrNXLUGpv9LlJnlRO01xZpUEycANFC9ETLBzwFaGHsSmZaGooAOIszGkeBZnQfat+A7tB9fBMIy6SiW+aSGakvG0eaHq+31S1VANtfGBu44Uw/a9gTdp/DVvHsCY7wS+DHmoUsPaudij8MSbROpcSbw3U6fPgNFLU/ANSlJiJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063197; c=relaxed/simple;
	bh=EwXIp3gWV9kMY/Q+G0RIBqgZ2dhkIXS66zfABFuuQhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZed5tWBD76NZg1oIUvg46boFdaGRCbG37E6NFXPnq4IOy3tU4gj5m2ojNUL/xg2H6JUagUcDaNuuLx58+rY6urzzHGID++1E2gyrq6TEIxwIs3dTLFPZll2Ii6zwlnYWtbg3057DEPcf+/NyGregcADhOwvG/FzsxRETbrXdrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YcFjxhRR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YcFjxhRR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2D5C116D0;
	Wed, 25 Feb 2026 23:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772063197;
	bh=EwXIp3gWV9kMY/Q+G0RIBqgZ2dhkIXS66zfABFuuQhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcFjxhRREut5n0v7yziitaqeW/W6j/V3+2G3U+Mr3zfawYU+uL9gIZqYSMz6bSEJr
	 Ud4Ez0kaEug2Ek+ffSmyhU+unAVEU1WoAims1uQA3Qbr/UY37q9rO1koDegTWUT5Zg
	 T1Ueza1UFIMCfk6IaWk1dWYeNSNciuNTZvqobfhc=
Date: Wed, 25 Feb 2026 15:46:28 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com,
	kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Theodore Ts'o <tytso@mit.edu>, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <2026022547-confirm-upturned-a736@gregkh>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
 <2026022539-commotion-huskiness-8736@gregkh>
 <aZ9p2RMrJL1mQ10w@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ9p2RMrJL1mQ10w@devuan>

On Wed, Feb 25, 2026 at 10:45:48PM +0100, Alejandro Colomar wrote:
> Hi Greg,
> 
> On 2026-02-25T13:23:24-0800, Greg Kroah-Hartman wrote:
> > > > Commit date also doesn't matter.  If I commit a fix to one of my
> > > > branches today, but Linus pulls it in in 2 years from now, what would
> > > > that date really show to anyone?
> > > 
> > > I think this is a bit confused.
> > > 
> > > If you commit a fix for a commit that is in Linus's tree, your Fixes tag
> > > will refer to the mainline commit, and the Fixes tag will remain valid
> > > if the fix is pulled by Linus in the future, because it will continue to
> > > refer to the same commit with the same hash and date.
> > 
> > But we do not need the date!  It provides no additional information that
> > we can't just look up if we really need it.
> > 
> > The HASH ("text") format does 2 things, it provides an id we can use to
> > look up more, and the text is there to give humans a hint if they don't
> > want or need to look it up.
> 
> The date gives more information to humans to decide if the commit is
> important to look up.

No it does not, that is what the subject determines.

> Sometimes, a subject can be ambiguous to the human, even if it's not
> ambiguous to a machine.

Then work with the developers to not provide such subject lines.  Don't
rely on a date for anything, that doesn't help.

> The date can help give
> some context to a human.  For example, one could relate a commit to a
> series that was merged around that date.

Again, dates of commit time do not reflect the date of the release it
shows up in.

> I appreciate seeing the date in my Fixes tags elsewhere, as it avoids
> looking up some commits, which I would look up if I hadn't seen the
> date.

That's great, but again, for the kernel we don't need or want this.  If
you do want this, great, you can add it yourself as Sasha just showed.

> Secondarily, it helps with the ID, in case it becomes ambiguous.  But
> I started using it for the human part of it.

Our ids are not ambiguous.  Our "problem" is people putting git ids in
the logs that are not valid git ids.  Just happened again today as we
are "human".  Putting the date in there would not help with that very
real problem we have today at all.

thanks,

greg k-h
