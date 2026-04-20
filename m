Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4493A7593;
	Mon, 20 Apr 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706843; cv=none; b=VnbCuuVwXpCGt+MdC/ROpkNPJBBF+aC5V4gro0+fa2HWFwh7L3iIGbnQ0TmStg8Q/oR8WRxBkarnQ37naHhOdIesWRwNtWhPkrxnUvl0qcA6Hi71gIaFocxDE5I4WTDHmoDkTF1L2BTThJrRoCPyZeoDxhS+nsNIkI48tLJhZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706843; c=relaxed/simple;
	bh=tLsRDq1DNJTHCMmwa4l1ohdBGwaK7G6Fun3K6cHQE88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAWCSfXJPNNSM1DMNuHB9Eq/lCTBgz+QaVENcbrLZ7DtIo4+0CbNmi3I1wjO9vhOAL9Bba9xGOXJC8pfsNAzKaWC1333xndU8mR97rLVz2Uqxe863kdQTIVyW0UcaukgJX4FqGYT1fGRo+KjBRSLJ3TUO47jKVyfZX07UBxmCxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vEBtyQih; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vEBtyQih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12610C2BCB7;
	Mon, 20 Apr 2026 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776706842;
	bh=tLsRDq1DNJTHCMmwa4l1ohdBGwaK7G6Fun3K6cHQE88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEBtyQih9u8XdcDlfahfz68TGfckYjA2qcffs7P9HZhqTdwIj0mxDtDtvfamdb8BX
	 hTxQYvUrCcvD3U/rnvdXurDeFXL6c0+/GiD3fgFxoU+rDYHKj5YtVRrQybi7dY+ocg
	 +sHe/fAhsv8WYBSxw6/aoSHMAfx6uesRpk76OE5A=
Date: Mon, 20 Apr 2026 19:40:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Blake Morrison <blake@truealter.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-assistants: add optional Acted-By:
 trailer
Message-ID: <2026042035-retention-platonic-e5d5@gregkh>
References: <20260420142741.3187814-1-blake@truealter.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420142741.3187814-1-blake@truealter.com>

On Mon, Apr 20, 2026 at 02:27:46PM +0000, Blake Morrison wrote:
> The existing policy correctly separates AI tool attribution
> (Assisted-by:) from legal accountability (Signed-off-by:). In practice,
> contributors increasingly work across pseudonymous and legal-name
> contexts, and a third slot -- identifying the human sovereign identity
> under which the work was performed -- lets downstream tooling (CI,
> provenance trackers, identity systems) bind a commit to a stable handle
> without disturbing the DCO.
> 
> Add Acted-By: as an optional, informational companion trailer. It does
> not replace Signed-off-by:, does not change DCO requirements, and does
> not mandate any format; the out-of-tree
> draft-morrison-identity-attributed-commits defines one such scheme, but
> contributors are free to use any handle form they prefer.
> 
> The three trailers then map cleanly:
> 
>   * Assisted-by:    -- what tool drafted this
>   * Acted-By:       -- who the human was, as a handle

I really do not understand, how would this actually be used?

And as you have to have a signed-off-by, why would you use two different
names for yourself this way?

And who is asking for this?  Who would want to use it?  How would you
use it for this very commit?

confused,

greg k-h
