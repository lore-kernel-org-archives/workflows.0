Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95733F36E;
	Wed,  7 Jan 2026 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814517; cv=none; b=ZbbAslXtkyJoxc5bCZlv83SVspvH899iFz2+vAfdr5ZUPyIWCMGHFdPZrgcJbIBsS4nkENBC9yOzIlw3nRWb87Wf0U7IsREVPtjul1siTEiyi2KmLm3iZBmb8Gl+X4lQLkC3VuuoHDH8cDmjYbDuoX4/Uo9yr2xM0StLDxo+sL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814517; c=relaxed/simple;
	bh=IcktqVO7I/DieJQlKCk3uSX2cIXyZAqkwils7DG7tV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPS9ASHBVyxyNno13VRBCuTZNHu69eACmFh4cpgIlPBqTTCEJIHxZBX+Z4nLF6xBVKXKF+tDXtDvG4gHFRP1SsuJ6ks7midpI+uMDQla+sAgTUGG4aUGjBfnvb9ofoAofDOilxETSFcjwF93UC7RNm5dYV67atVrGeO/ei813rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qkXg7kzO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qkXg7kzO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33CAC4CEF1;
	Wed,  7 Jan 2026 19:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767814517;
	bh=IcktqVO7I/DieJQlKCk3uSX2cIXyZAqkwils7DG7tV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkXg7kzOQBPcXuszqE5Rp930req2QIJC2PLw08BewH7WA/arMmcLh7sY2f+/NVEwT
	 7rSB/2i3+n0zMAh7sXI1bUCNntTc7svCOIJl0eblArvnJID57lu9cSYMG1ucdgMDI3
	 eQ3n1b1RU0SZqb1rMSAbBivZLZV85HJaw2PzBSMA=
Date: Wed, 7 Jan 2026 20:35:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
Message-ID: <2026010726-crusader-recoup-4825@gregkh>
References: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
 <4702253d918c8edb899a91fbd79b40199a013264.camel@perches.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4702253d918c8edb899a91fbd79b40199a013264.camel@perches.com>

On Wed, Jan 07, 2026 at 10:40:11AM -0800, Joe Perches wrote:
> On Wed, 2026-01-07 at 18:12 +0100, Krzysztof Kozlowski wrote:
> > Sources already have SPDX-FileCopyrightText (~40 instances) and more
> > appear on the mailing list, so document that it is allowed.  On the
> > other hand SPDX defines several other tags like SPDX-FileType, so add
> > checkpatch rule to narrow desired tags only to two of them - license and
> > copyright.  That way no new tags would sneak in to the kernel unnoticed.
> 
> I find no value in this tag.  I think it should be discouraged.
> 
> How is it different or more useful than a typical Copyright or © symbol ?

It's easier to parse automatically and put into other places (like a
software bill of materials).

I don't like it all that much either, as really, it doesn't mean much
(go talk to a lawyer for details), but it's already in our tree so we
might as well document it...

thanks,

greg k-h
