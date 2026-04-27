Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8C3CF69E;
	Mon, 27 Apr 2026 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297783; cv=none; b=tObu+o1zvpSZJdVjtcoJOzBLwP4+2OSqkr0ODzretSCuAaDpm0m7w+p7lcJnlyJj9kRFb8jPvVjkPdhVXRXt6aGo+CyvsbgBxRrzhFBT4yTq4sAwX8BFGKFZa/MzY0De08aFum9WoPDfnwucvaUCJt2G9H+s5wEVoTLdFo6hr3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297783; c=relaxed/simple;
	bh=1jT06HNmD4c1aAP11xIK87nFG5vUeV1cPhaJHIcg84Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S402IRt4DaX3d8Y/Q5ODwZvr5c3dcdMjRjugOt7EjO/L99eSC9BNZS/bvgwff6XrQcrXtHCVniA/dUCRGcP1kQKLXr+iiJZzJm2aVFvxbpQjlqP1hvQzvVf/iD28herEGpMs7v3m9CODfrhlDZnv86Gx+bnzRtU98Q2Ocig01Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74E4C19425;
	Mon, 27 Apr 2026 13:49:42 +0000 (UTC)
Date: Mon, 27 Apr 2026 07:49:08 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: security-bugs: do not systematically
 Cc the security team
Message-ID: <2026042727-recital-twiddling-eb22@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-2-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426163914.19449-2-w@1wt.eu>

On Sun, Apr 26, 2026 at 06:39:12PM +0200, Willy Tarreau wrote:
> With the increase of automated reports, the security team is dealing
> with way more messages than really needed. The reporting process works
> well with most teams so there is no need to systematically involve the
> security team in reports.
> 
> Let's suggest to keep it for small lists of recipients, to cover the
> risk of lost messages (spam, vacation etc) but to avoid it for larger
> teams.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>

This is going to cut down on emails to us a bunch, which might be good,
or not, as now we'll not have a way to know what's going on overall.
But hey, let's try it and see what happens!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
