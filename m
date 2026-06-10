Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E842DEA74;
	Wed, 10 Jun 2026 06:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071865; cv=none; b=kpqYN5Wfsh9nqn3Zx8qS6G46Rx3PslXfXp1eutc/2O1TDduFAsnEkzPAEkmuS4P1qXdeItQVVcNgN1WE8gJH8cmq/O+8hoDkNH4LhDqsNqWQBzOyIellPpFcBD4ejcUfmyZJa9Af9u5wwtiiZsEB70AambuG2SyeSFSSoToRqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071865; c=relaxed/simple;
	bh=XjQs8t3Uy5W8sj+cp5Uo44445Q+nb1DDRE7s65qYH4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6PNRbVFBhxRmNADi2ZE+Kx+Mmu1JNertpGRVdni1Hvx7SS+oiTmj3Yn9g3qJvL3sAl9Lev8ZMWtKaU9ef1pwC+sN3Y9IJF16DukYA28nh+z2+gLemnLFIKBxp3XootN8lmjaL/HHRACDH7vOFqJpExdBfRZtQMwzCKrraxG4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oBbldOFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oBbldOFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA4C1F00893;
	Wed, 10 Jun 2026 06:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781071864;
	bh=aYB75DAPml4GJY6HEdNZEK5p4VaXgRYbMYU4m0rmk6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oBbldOFh99oHye83hP0HamJdRvl1cgA5fJE8CR7lZk82ktoka018NTWk9O7dlJ2Kg
	 EKrxSB6h8ACJFVxC6k7DKoEk1TntxPeQZtVJX15hlZaF2O2lOwpbdAdm0xknM3vk4V
	 BMghi2had5BTSPAFo2LyhV45XaPvgZmWbOHnN8rQ=
Date: Wed, 10 Jun 2026 08:10:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: w@1wt.eu, corbet@lwn.net, leon@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, security@kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026061046-wrangle-canary-bf00@gregkh>
References: <20260509094755.2838-3-w@1wt.eu>
 <20260609083305.2382925-1-safinaskar@gmail.com>
 <2026060955-zesty-cucumber-1a49@gregkh>
 <CAPnZJGAKHu4rR8+W67KRQYVwRqi3x2Y+iWwhG7a2bY7oEawhfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPnZJGAKHu4rR8+W67KRQYVwRqi3x2Y+iWwhG7a2bY7oEawhfg@mail.gmail.com>

On Wed, Jun 10, 2026 at 04:03:43AM +0300, Askar Safin wrote:
> Thank you for answer!
> 
> On Tue, Jun 9, 2026 at 11:44 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > - If unprivileged user prevents privileged user from suspending
> > > system, is this security bug?
> >
> > Physical access of suspending a machine feels like an odd threat model
> > to be worried about :)
> 
> I think you didn't understand me here. I meant the following situation:
> unprivileged user without physical access was somehow able
> to prevent privileged user with physical access from suspending
> or hibernating the system.

If you can find a bug like this, sure, we'll be glad to review the fix
for it.  As for it being a "security" issue, that will depend on the
specific case as "can not suspend" doesn't seem to fix the definition of
"vulnerability" to me.

thanks,

greg k-h
