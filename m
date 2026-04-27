Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF13BED37;
	Mon, 27 Apr 2026 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297852; cv=none; b=aS7qy+6aywxPGp0VrbsXNFGmBZgBxRZHiuHeIuk8muIpgjv3Qi2oN5FTdXGm3X0/hEQ5hyuYE6AmaLGgXjAH/ocsfFisbCijNEhMv+fsumdY28U5n0gye+e0+EI2E8pqlH32JI3sfkA7uMgZB6q6NR/ooqLaqOudD5xkTBQwHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297852; c=relaxed/simple;
	bh=4nyv8Zmag9UkEM/i0o6h8KU01nqrq203CMsueAUVOPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFfUlzWI7gmARCoQTu1uRue0Uot6N/Jl6jQOqCFn78nf1XaFXt1vMnE/27Hm/3sUxdxnGxWWVXMWwIN5SLKAMJo2jPCR9geiQIpGkWWwVi1ZkBibizj9fIdsGIa/4jmwjxkOl7yBp2kLd3dzpeXfjsMEuz02nfNuBhK+BHICSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A65EC19425;
	Mon, 27 Apr 2026 13:50:51 +0000 (UTC)
Date: Mon, 27 Apr 2026 07:50:16 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation: security-bugs: clarify requirements
 for AI-assisted reports
Message-ID: <2026042705-nearest-storm-9f76@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-4-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426163914.19449-4-w@1wt.eu>

On Sun, Apr 26, 2026 at 06:39:14PM +0200, Willy Tarreau wrote:
> AI tools are increasingly used to assist in bug discovery. While these
> tools can identify valid issues, reports that are submitted without
> manual verification often lack context, contain speculative impact
> assessments, or include unnecessary formatting. Such reports increase
> triage effort, waste maintainers' time and may be ignored.
> 
> Reports where the reporter has verified the issue and the proposed fix
> typically meet quality standards. This documentation outlines specific
> requirements for length, formatting, and impact evaluation to reduce
> the effort needed to deal with these reports.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 55 +++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)

Nice addition!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
