Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C2D456DFB;
	Wed, 19 Aug 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147582; cv=none; b=eY95WVaA00t5THb4EhxNcV8mWbFCnbjyhOWuvPhRdKrw+SLdGkBZdtmA/1YWVRG1V/a6Mars48TXedx7ZLUM6TH+1H5XqpjfNVaYCg0PztI62oKHZcdUOkpWdSpOYhBU+U+e2lSEKOwF+J7MyZIgpKMtn04Bo6rphrheAHmxQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147582; c=relaxed/simple;
	bh=A8JkJES0R4mw2oq/qx2f6LfMoaTL/x66k1KaWgkyNhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZkUzNU4EDPd2G/MrOurD8vwLiZLwt7Xf26koTGHbL3HRthldjWYCj3gWP7jYlx9wjqLzPo78oHTeM5UOlqg9ikV2eB+bFHntSHgnLp2iDJqRA7UfqVmbk/cgC9z0gMUYfjxUGbLRL9XYscOOr7srXcl5+qgvjWvkZCGvHclC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=nQJJDsvn; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="nQJJDsvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1787147574; bh=FfyQB+HSOvKsWsQVvF7DaB91JFIljJtprMU7MHJjIaw=;
	h=From:Message-ID:From;
	b=nQJJDsvn0h+Asg9BdR0vp6bSqW42rRvhsZyQrnGGRFhsmgZNzzR6eyjGl+VBS0yvF
	 NIQdcVKCQ2kEzSk1Ka48qW7bn+nUxjr7X7x/pP9fnVENSzIDppP5lDUCMw+pQh8phV
	 0qbRKXhk9gcUHuP/ka3WJOQzi33rPH+z/fE2mPvA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 9BEC5C0954;
	Wed, 19 Aug 2026 15:52:54 +0200 (CEST)
Date: Wed, 19 Aug 2026 15:52:54 +0200
From: Willy Tarreau <w@1wt.eu>
To: Johan Hovold <johan@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: threat-model: fix /dev/kmsg reference
Message-ID: <aoW1NiglZavo68pc@1wt.eu>
References: <20260819134039.286793-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819134039.286793-1-johan@kernel.org>

Hi Johan,

On Wed, Aug 19, 2026 at 03:40:39PM +0200, Johan Hovold wrote:
> Fix a '/dev/kmsg' reference which got replaced with '/proc/kmsg' (which
> is not accessible to regular users).

Actually it wasn't "replaced", it's because I didn't know about /dev/kmsg,
for having been used to /proc/kmsg for decades long before its /dev cousin
was born :-)

> Fixes: a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Willy Tarreau <w@1wt.eu>

Thanks,
Willy

> ---
>  Documentation/process/threat-model.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
> index a68be888ce8e..04e5df6a6f78 100644
> --- a/Documentation/process/threat-model.rst
> +++ b/Documentation/process/threat-model.rst
> @@ -84,7 +84,7 @@ possibilities of user namespaces are not covered in this document.
>  The kernel also offers a lot of troubleshooting and debugging facilities, which
>  can constitute attack vectors when placed in wrong hands. While some of them
>  are designed to be accessible to regular local users with a low risk (e.g.
> -kernel logs via ``/proc/kmsg``), some would expose enough information to
> +kernel logs via ``/dev/kmsg``), some would expose enough information to
>  represent a risk in most places and the decision to expose them is under the
>  administrator's responsibility (perf events, traces), and others are not
>  designed to be accessed by non-privileged users (e.g. debugfs). Access to these
> -- 
> 2.54.0
