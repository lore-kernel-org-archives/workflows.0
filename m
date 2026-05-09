Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8D52032D;
	Sat,  9 May 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778312597; cv=none; b=Nex2EAeYELApN4UYn2fplQLUMVuH5a3pNEmNnymJn3o8oPVzETuz+TpIwtGEO+pAcPsQg5JGrgWWpW2Z3s8RxOhUJUKEsvwSIxZSm/22gKqgtk+bxrQKgiHoeOCYmqlVP/8HOIMtnush3sQ/+f46oXjkPCJeDlS1e+guljWozZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778312597; c=relaxed/simple;
	bh=8rXph+LiwUqUYpYHxBffywz5fFMPlPt6uTyLbVLpCCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhMDaetS60U1f8gR8cVhMh3rN9rOtC+lu2yahnD3WqDjoGT/OvLxem4aYllX2gx0rFpaBaBRkycXfy8IS/54EBYMFrST1crvNMX+2A29VjJ03BS7mCqWywugxT1QWFaZHwNgJ8Ejhcb2N5l8evDNCwoVsD5kgLAzjQqglLucLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=ZAO8z8WY; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="ZAO8z8WY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778312592; bh=dDNp1ZQYqtodDJ36egovcG8H9jrjzQo8iK+gXNffal8=;
	h=From:Message-ID:From;
	b=ZAO8z8WYkuA/gCU3KIGS0TermrJE6KynSGAD7Guc/YBlt7COXg3DfiiYEOmzjvUgn
	 SwR80mtRxFq/iRq/cdn1zBP2jvwajtFI/HmSTEIhxdkXCCKEuHH4+VMNi7rfQ0s8Ve
	 d5qaGwhDvx+K1yxHhbxsdKD/6S3GerHwZd4r9yP0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 5CA74C0B74;
	Sat, 09 May 2026 09:43:12 +0200 (CEST)
Date: Sat, 9 May 2026 09:43:11 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, leon@kernel.org,
        security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <af7lj1zH-4wvMAI_@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <2026050801-semifinal-expulsion-9af6@gregkh>
 <af4IW_ycR2RpAjhy@1wt.eu>
 <af4RqzO_VHYAqcHf@1wt.eu>
 <2026050929-hatred-underfoot-a32a@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026050929-hatred-underfoot-a32a@gregkh>

On Sat, May 09, 2026 at 08:39:37AM +0200, Greg KH wrote:
> On Fri, May 08, 2026 at 06:39:07PM +0200, Willy Tarreau wrote:
> > Greg,
> > 
> > does this addition on top of the current patch address your concerns ?
> > 
> > --- a/Documentation/process/security-bugs.rst
> > +++ b/Documentation/process/security-bugs.rst
> > @@ -88,6 +88,14 @@ can be easily exploited, representing an imminent threat to many users.  Before
> >  reporting, consider whether the issue actually crosses a trust boundary on such
> >  a system.
> > 
> > +**If you resorted to AI assistance to identify a bug, you must treat it as
> > +public**. While you may have valid reasons to believe it is not, the security
> > +team's experience shows that bugs discovered this way systematically surface
> > +simultaneously across multiple researchers, often on the same day. In this
> > +case, do not publicly share a reproducer, as this could cause unintended harm;
> > +just mention that one is available and maintainers might ask for it privately
> > +if they need it.
> > +
> >  If you are unsure whether an issue qualifies, err on the side of reporting
> >  privately: the security team would rather triage a borderline report than miss
> >  a real vulnerability.  Reporting ordinary bugs to the security list, however,
> > @@ -102,7 +110,7 @@ affected subsystem's maintainers and Cc: the Linux kernel security team.  Do
> >  not send it to a public list at this stage, unless you have good reasons to
> >  consider the issue as being public or trivial to discover (e.g. result of a
> >  widely available automated vulnerability scanning tool that can be repeated by
> > -anyone).
> > +anyone, or use of AI-based tools).
> > 
> >  If you're sending a report for issues affecting multiple parts in the kernel,
> >  even if they're fairly similar issues, please send individual messages (think
> > 
> > If so I can resend with it.
> 
> Looks good to me, thanks!

Thank you. I'll integrate Shuah's comments and will send a v3. After
that I'll see if we can better split the public vs private part, because
I'm starting to find it complicated, but I don't want to postpone for
too long if having all of this can already help us.

Willy
