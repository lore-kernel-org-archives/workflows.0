Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92EF20C00C;
	Wed, 25 Feb 2026 21:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054614; cv=none; b=cfJF3NfchsQQ04aVf1Dnfp8SV5LOfOPBuMVk9hfRIKIvng6fb57SVR7auTFU2wU8HqYn9LsniGt154oYk0Njvra7D/T1Wk6XSkTMbr1kBmSMUvbzilMoD7jmeefcfTZe4+EI7mvZfS8cI+RNMsGT72GM/rdtreQudrPW3Tm6AqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054614; c=relaxed/simple;
	bh=XpD8kt3dpsrmE3c5Z6FVGEtE8v2IAgFgUuS806RXi/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rm16NWQF3doLo6ycyjQ68EqhYdi5aB9ulkjDFEz46WKYKPiTlC1GUxScpZ0ei57PpFZSg9hJfm9IqdEIS5Y2vOcPOd6RjQbdAEbvB1r3S3MX0C9LHuvoK+L8HpNpjCbRtXMBZEYlQYYkcUvTYhUhjBvfUVm1n2Mkk4TQwJW/8w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yDzXB1gz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yDzXB1gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44090C116D0;
	Wed, 25 Feb 2026 21:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772054613;
	bh=XpD8kt3dpsrmE3c5Z6FVGEtE8v2IAgFgUuS806RXi/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yDzXB1gzXsHOU9d6OcLY/V/iyLgNSI2Ll6dL6XvQsji/ZyVWCVQ/4V6TVXN5CTpoK
	 klyfeT711j5p7187w8QRDb26uTE73Vv+tOljqirUj23jm13mx3G9aQ4PUUs2RV1ef+
	 5xy/yGcazv/x4Z+macADDeL0nVFmvzJcPcq+TiS8=
Date: Wed, 25 Feb 2026 13:23:24 -0800
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
Message-ID: <2026022539-commotion-huskiness-8736@gregkh>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ87Z24f9HZsofGl@devuan>

On Wed, Feb 25, 2026 at 07:20:25PM +0100, Alejandro Colomar wrote:
> Hi Greg,
> 
> On 2026-02-25T10:00:06-0800, Greg Kroah-Hartman wrote:
> > On Wed, Feb 25, 2026 at 01:56:02AM +0100, Alejandro Colomar wrote:
> > > [Message-ID: <2025011032-gargle-showing-7500@gregkh>]
> > > Greg wrote (Fri, 10 Jan 2025 13:32:22 +0100):
> > > > Please no, you will break all of our tooling and scripts that parse
> > > > these types of fields.  The git commit id and commit header is all we
> > > > need to properly determine this type of information, no need to add a
> > > > date in here at all.
> > > > 
> > > [...]
> > > > 
> > > > So I don't think you need to add a date here.  Dates also really do not
> > > > mean much with commits, what matters is what release a commit is in, not
> > > > when it was originally made.  We have commits that take years to show up
> > > > in a release, so if you only look at a date, you will be mistaken many
> > > > times as it's not showing what came before what many times (i.e. we
> > > > apply commits out-of-date-order all the time.)
> > > 
> > > As I said above, I agree that the commit date is the right choice.
> > > Author dates can be out-of-date-order by years.  Commit dates are
> > > necessarily in order, though.
> > 
> > Commit date also doesn't matter.  If I commit a fix to one of my
> > branches today, but Linus pulls it in in 2 years from now, what would
> > that date really show to anyone?
> 
> I think this is a bit confused.
> 
> If you commit a fix for a commit that is in Linus's tree, your Fixes tag
> will refer to the mainline commit, and the Fixes tag will remain valid
> if the fix is pulled by Linus in the future, because it will continue to
> refer to the same commit with the same hash and date.

But we do not need the date!  It provides no additional information that
we can't just look up if we really need it.

The HASH ("text") format does 2 things, it provides an id we can use to
look up more, and the text is there to give humans a hint if they don't
want or need to look it up.  There is no need to include anything else,
let's keep it simple please.

thanks,

greg k-h
