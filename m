Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74E3FBEBB;
	Tue, 12 May 2026 05:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565286; cv=none; b=nVUSdZNqB2oYebfMEbtEh4EBbgHrYwhAvNIJgA77GDxnRJMI9QCFjy7D/XH9mY41Oi492fhnJT5OYNAp0Qi8z7Gn7/gc3sH0HP0s9GgsYhbi5rBSFGNNdaoRuvFadTqZy30XplbuXyT2rB55d1nB9Pk4lD/VdqsB58r7vDSOokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565286; c=relaxed/simple;
	bh=T1uvXWQwvF2bepvKoDqzZfoy5eCFlwpcjr1dGaxN+lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHm5NoyoF3x2+7gqFqVAowUaE19vylDYqTPq1DFliBpcF9E8SBkbLC5OUCnKWzDwCdtQiKxL7dzsuhxpYxKVNJ42XvEzVf0o+IZUwN9iY4+8Oa1M+Et/tPV0pbMMmMohdbbjKE8NG3RurO9QZaDvhbXV8HMYltVwSlRKdXpY7ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=R+V1b/9E; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="R+V1b/9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778565275; bh=hmR5WO8hnqps6Ru9C04/EQ5xZ8D2yTRk1QJ7tmpsW58=;
	h=From:Message-ID:From;
	b=R+V1b/9ErKqxgGUNSAcY8RXHL6xUNSpPe1O9Hi8cXSJD1g4JPazyBbrPvcKLRh5iI
	 kriDZgGszNy9qvuSGWg4oV9Asl3aEeGMBF8c93aioyS3R2FL7mPcbRfEZgJyDmRYt5
	 YQe+AgyE6Jal1P2Uwzpt915h83/K0WU2Rzq/FpLQ=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 12E1FC0A80;
	Tue, 12 May 2026 07:54:35 +0200 (CEST)
Date: Tue, 12 May 2026 07:54:34 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <agLAmvdo3JNTre4Y@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <2026051124-afar-renewal-795c@gregkh>
 <agIZ8zeg3m0xE3yL@1wt.eu>
 <878q9pvlif.fsf@trenco.lwn.net>
 <agI7XogSmfN_Pm4t@1wt.eu>
 <87a4u5u195.fsf@trenco.lwn.net>
 <2026051220-fetal-obituary-bb2b@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051220-fetal-obituary-bb2b@gregkh>

On Tue, May 12, 2026 at 07:46:34AM +0200, Greg KH wrote:
> On Mon, May 11, 2026 at 02:42:14PM -0600, Jonathan Corbet wrote:
> > Willy Tarreau <w@1wt.eu> writes:
> > 
> > >> I can ship stuff Linusward quickly too... :)  But it's fine if Greg
> > >> takes it, of course.
> > >
> > > Oh that's fine then. I thought you only delivered such updates into next
> > > releases. I'm fine with either way of course! Let's pick the path of
> > > least effort for each.
> > 
> > That's my normal procedure, since there are few docs changes that have
> > greater urgency, but I do have a "fixes" branch.
> > 
> > Greg, what's your preference?  Unless I hear otherwise, I guess I'll
> > apply it shortly.
> 
> Please apply it and take it through your tree, thanks!

Thanks to you both!
Willy
