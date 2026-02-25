Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311918872A;
	Wed, 25 Feb 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042415; cv=none; b=R2T6ygc+CKhbaWmON/C0LDaNW5k4cWKJlr99UmNGdfp3CxPrzFjFdPIQkEpPwTOhb+SSlUkU3CdufcmttB1xsVbCMWmQWcaWjgWwm5g4PT2LF4TAA2K9wrYWQRY1oyNubEHt6IfrqjWYaR+KbLaisIGcYkCNoQ9/YYruVilsVws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042415; c=relaxed/simple;
	bh=Pe1dA8iNPbgfGAGDMx9LqUUVkWuBcgVV9rvcL94i7kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Li/a/20TWGFSp4TYNenR0GOJXQi8j07BVfOZf7piz1VtjVMGX39ppLmH1L6yniQ7iN8nXRA2Oyqx849BU/g9+3zTmoObdssK4ixB5wFmtFKbO86j7n3wdaN96NYENkTF1HkcBsUIlArVEcOdRwsXYOm7PHXP4GY74ZYWa0bpFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TFS3OJz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TFS3OJz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3986BC116D0;
	Wed, 25 Feb 2026 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772042415;
	bh=Pe1dA8iNPbgfGAGDMx9LqUUVkWuBcgVV9rvcL94i7kY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFS3OJz/6nZd1C0pxWBVCpEqgSKDK7DFGi9xA39EqRvANK5cUCkC1fP+lHPaDVaOR
	 kyAK27CkkQirJol125b7DldnYFAU4xtidT08+UyzLYZCO3+wpJK/wFcMpBy0qE7WlJ
	 +Ig9v6yJrTq7OFT3pgO7j+ySdOzuf6C4IxFLxgKY=
Date: Wed, 25 Feb 2026 10:00:06 -0800
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
Message-ID: <2026022531-tightness-rare-6a14@gregkh>
References: <aZ4_sBIy8rOUL59Q@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ4_sBIy8rOUL59Q@devuan>

On Wed, Feb 25, 2026 at 01:56:02AM +0100, Alejandro Colomar wrote:
> [Message-ID: <2025011032-gargle-showing-7500@gregkh>]
> Greg wrote (Fri, 10 Jan 2025 13:32:22 +0100):
> > Please no, you will break all of our tooling and scripts that parse
> > these types of fields.  The git commit id and commit header is all we
> > need to properly determine this type of information, no need to add a
> > date in here at all.
> > 
> [...]
> > 
> > So I don't think you need to add a date here.  Dates also really do not
> > mean much with commits, what matters is what release a commit is in, not
> > when it was originally made.  We have commits that take years to show up
> > in a release, so if you only look at a date, you will be mistaken many
> > times as it's not showing what came before what many times (i.e. we
> > apply commits out-of-date-order all the time.)
> 
> As I said above, I agree that the commit date is the right choice.
> Author dates can be out-of-date-order by years.  Commit dates are
> necessarily in order, though.

Commit date also doesn't matter.  If I commit a fix to one of my
branches today, but Linus pulls it in in 2 years from now, what would
that date really show to anyone?

Again, all that matters is when a commit is in a release, and for that
you walk the tree/graph to determine it.  Please don't consider changing
the format of our commit identification logic as we have tools that
parse and handle what we have today, and all would be changed if we were
to change it.

Especially when it doesn't even provide any specific value that I can
see, if you want that info, just get it directly from git after looking
it up.

thanks,

greg k-h
