Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD522C027A;
	Wed, 13 May 2026 11:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671456; cv=none; b=M9orIiAwG7gqpF3aY13y+zA9BzbYgZlVTnzeT80xYQ6ygt28Rhb5U/es0GGxG0/f400MI7o4pfpu1FdQHjD4ToL9pbzJY/yZYwnzBs2gYCKHg0CHKaAmicI4YG0Zss4zvFFNmgy9TYbAnpkuMnR5/aKOAnW/RZqeVF06OhIIFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671456; c=relaxed/simple;
	bh=oEZPJ1MzqkD/9v6N4n7VNTwvq5hw0lowUFSI/wrNHXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trXoalSZB6eS8B3+Z4GvXIiHvsgUtw8dt5xbudpIecGFL8URkqBO7xIO5UNaH1Q1dM6WtuV674yBjA8+SsoLqEq2iKwaf64AI8wHTSzvqil0wfIsrpk+MxlMYZHeICOFu0JgLAC3poqbPrRZ53Botm8BGj5luesDVIKf9HLzHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=TRnSsWEZ; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="TRnSsWEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778671453; bh=q23MY6RW6jkdoiTZ3mnQnlFcQQnXpwD1WlMAMTZrVQw=;
	h=From:Message-ID:From;
	b=TRnSsWEZErHwlD+pGg7diEKHdOO88dj1skZPCMSpTMtWoC7GVuaoU/bl8Ou8T9ZFK
	 SDx/B7Rdh5ZpCPj4aF+8IlBwDisoJUEbN0boghV570HRAWFpSJZ/fjyLlEzhWM471i
	 BhapgeiVdsMYx78tCeQQIAiC7Zgvv666SIqB+Tro=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id CE115C0A50;
	Wed, 13 May 2026 13:24:13 +0200 (CEST)
Date: Wed, 13 May 2026 13:24:13 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <agRfXQvN7ZDTNGQG@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu>
 <87se7wo861.fsf@trenco.lwn.net>
 <2026051353-apricot-kleenex-fa57@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051353-apricot-kleenex-fa57@gregkh>

On Wed, May 13, 2026 at 12:30:10PM +0200, Greg KH wrote:
> > One nit:
> > 
> > > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> > > +    the kernel's threat model and go to great lengths inventing theoretical
> > > +    consequences.
> > 
> > If only we had a shiny new document describing that threat model that we
> > could reference here... :)
> 
> Ah yes, a link to that would make things better, but don't we have that
> elsewhere in this series?

It's in the same patch, I think Jon was sarcastic here. I thought I had
addressed that one but apparently I was wrong :-/

willy
