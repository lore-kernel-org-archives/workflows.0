Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D74F4745
	for <workflows@vger.kernel.org>; Thu,  3 Sep 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454666; cv=none; b=Bitm2DInyr1SuOYHfV2WykqTi+B1dwaRbq+JpZDtOWm3Gi+m/FgfQRAzxhWseYo/hTB123wXe1mz3FxR7BQYsh/QYrb1fz6MU2tQSENu1ZXkZ2FaeEp9C6xjkTMWF6fPsyv7P1XUo8pSzLQK33YX9sYn1rVdXzBLqeYdeTkAIUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454666; c=relaxed/simple;
	bh=yrTVed2V76HIXyGCXgr8lE+QFhABBpHQFtBkdMn89t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGb3/I5QWuIDvHQc9at3jwcYbo5ffPyc59TE09cfA4gdEAuzRdid3A1jkP20KarCaKDlaGgebz0pAoke7HV1m18PmQqsRZVxiP2ntptM9qC4JCnV7bGzPbfC67N+87e7gc8OklATOw9iYWgDhFI+7KvuNSbH1RpsBVevk0uUoCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=iVI4RRp/; arc=none smtp.client-ip=95.215.58.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="iVI4RRp/"
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yrTVed2V76HIXyGCXgr8lE+QFhABBpHQFtBkdMn89t4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788454662; v=1; x=1789059462;
 b=iVI4RRp/CXlFGFI/bOh+HorKVGdLzDjGJSZ/XMzbxIM318zzqnsyuekAc9zHyYLdZ82+YLhp
 q0Enp9KwRAb0eA3oj9yaN2UrmqDX1IVn3GjMYCv+tUlXCfWYSo9x9zIJewaX1HtobNI8+GuehwL
 OYHmdqOQzOslcYAf1xBkUNHkjYN0lJMq0bC77jm+vz3ummNJnYSMvhZU47+Os98EVicA3juTdpc
 HH/Zet1IQLYBzqanxD/bLy57CvxQmdvobqol3+zB0dbWEN+wTkUFCluExyD8r5RdgFx4AAFvSE7
 7NAFRArlK7u4ekk3rCtZ69s8sSnsoFnkiPgbeu6FDmStw==
X-Envelope-To: workflows@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c26a59a5668ff9b5;
	Thu, 03 Sep 2026 16:57:32 +0000
X-Mizu-Trace-ID: c26a59a5668ff9b5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 00:55:55 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nguyen Duc Thinh <ducthinh100812@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
Message-ID: <apmmmz0Xo6fXgFiV@wyuan.org>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
 <aploLWg-i315frp5@wyuan.org>
 <5efba8f3-ffb0-4e1e-8057-6946e1e96db8@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5efba8f3-ffb0-4e1e-8057-6946e1e96db8@infradead.org>

On Thu, Sep 03, 2026 at 09:33:46AM -0700, Randy Dunlap wrote:
> >> Nguyen Duc Thinh (5):
> >>   Documentation: process: Clean up grammar, tone, and contractions in
> >>     core files
> >>   Documentation: process: Clean up grammar and tone in next guide files
> >>   Documentation: process: Refine language, tone, and grammar in
> >>     subsequent files
> >>   Documentation: process: Refine language, tone, and grammar in
> >>     subsequent files
> >>   Documentation: process: Clean up grammar and tone across multiple
> >>     files
> > 
> > Output of 'b4 shazam':
> > 
> > ...
> > Applying: Documentation: process: Clean up grammar, tone, and contractions in core files
> > Applying: Documentation: process: Clean up grammar and tone in next guide files
> > Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> > Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> > Applying: Documentation: process: Clean up grammar and tone across multiple files
> > /home/user/Projects/linux/.git/rebase-apply/patch:72: trailing whitespace.
> >   License (about which more will be said below).  The author is not a
> > warning: 1 line adds whitespace errors.
> > /home/user/Projects/linux/.git/rebase-apply/patch:244: trailing whitespace.
> > Which is nice, since there is no more insanity in the form of fake-generic
> > warning: 1 line adds whitespace errors.
> > /home/user/Projects/linux/.git/rebase-apply/patch:261: trailing whitespace.
> >    rare cases, an AI assistant capable of finding a bug is capable of fixing it.
> > /home/user/Projects/linux/.git/rebase-apply/patch:262: trailing whitespace.
> >    Fixes written within the same session used to identify the bug will
> > /home/user/Projects/linux/.git/rebase-apply/patch:263: trailing whitespace.
> >    generally lead to better and more accurate fixes as the LLM's reasoning
> > /home/user/Projects/linux/.git/rebase-apply/patch:282: trailing whitespace.
> > - Within two weeks, a representative of this group will communicate the
> > warning: 4 lines add whitespace errors.
> > 
> > Should we handle with whitespace?
> 
> No, the trailing whitespace should be fixed (i.e., deleted)
> and then resend the patches.

Right, I was actually trying to gently point out that the trailing
whitespace should be fixed. ;-)

This should be caught easily by checkpatch.pl, or simply by running
b4 prep --check, I guess. Better run it before sending out next time.

Thanks.
