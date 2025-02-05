Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475C25A649
	for <workflows@vger.kernel.org>; Wed,  5 Feb 2025 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741091; cv=none; b=VnSJmLXmNA4Ouj5GXFd1b/3BWTKNugsJEqYCeScG/CX0ZxTX5WXs2LhcpiWJ5V2d7mrTwa1hNMv/HpWAbNyrgE4gnYhi1uz3prw1qH2NvbmeuaxDCo6zm4hvbC7WN01we+1C0nJfG8vV/uF1b356+BBHMoPNoR6SPpLsKoX1GgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741091; c=relaxed/simple;
	bh=HlNYFQ3NYjymYFg5mAdmajg9c6sM8VinOHGQYBVqXns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7UhKRSAyOvs4ywHVyEQGd0D3/jnIhVh74/mi0gcxNsXSvD2anU130gRTXeSWoxn9uPE7FtEgJ6l0fMGF9zAIRYB05mqCOX1KKjWceG5kaIM+kgzguU2ODOHcvffNh5bCN2S5v0ZDtrK9b5khI+vUhyhhMBFG/bvhYPHp2rDTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sfgUvxb4; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sfgUvxb4"
Message-ID: <0b68e534-df14-4496-802a-bc0437469720@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738741086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJq0jhWaqKdnYERgHRncnOv84+3G9xOucAEmDo4x5Ik=;
	b=sfgUvxb4FZQ1CHc9J9D5/pr8v66nMyi5wDN33Nz/KVkeQDdRgHBC8d4d9FxcK0n28XBlzt
	QPRN0tlmePh6X8UgeihXOl2B96bR9jDais8SBTetatlx8jyAgi2zqhV0Kw4I+w6hjt2Feb
	PLULSLjGLWCge3I4Tk9LZDsbBuqOKEo=
Date: Wed, 5 Feb 2025 15:37:45 +0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
To: Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250203174626.1131225-1-kuba@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250203174626.1131225-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2025/2/4 01:46, Jakub Kicinski 写道:
> Adding company name in round brackets to From/SoB lines
> is fairly common, but I don't see it documented anywhere.
> Every now and then people try to add the sponsorship lines
> to the commit message, fun example from this merge window:
>
>    Sponsored by:   The FreeBSD Foundation
>
> from commit 2ce67f8bf1ce ("wifi: iwlwifi: mvm: fix iwl_ssid_exist()
> check"). Better format would be:
>
>    Author: Miri Korenblit (FreeBSD Foundation) <...
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>   Documentation/process/submitting-patches.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 8fdc0ef3e604..12ed28b3d113 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` line is missing,
>   then the ``From:`` line from the email header will be used to determine
>   the patch author in the changelog.
>   
> +The author may indicate their affiliation or the sponsor of the work
> +by adding the name of an organization to the ``from`` and ``SoB`` lines,
> +e.g.:
> +
> +	From: Patch Author (Company) <author@example.com>
> +
It looks great, but I'm a bit worried that it could be misused,
which might cause trouble for some companies. Even without
this patch, there's no way to prevent the misuse.
Consider the following situation:

From: Yanteng Si (linux foundation) <si.yanteng@linux.dev>

Obviously, I'm not a member of the Linux Foundation.

This might seem a bit absurd, but I think it could actually happen,
especially with some driver code. Hardware manufacturers would
prefer to upstream their code under the guidance of their companies,
considering subsequent hardware iterations. However, if some
enthusiasts pretend to be company employees, and the maintainer,
trusting the tag, actively applies the patches, it could disrupt the
rhythm of the hardware manufacturers and is not conducive to code
maintenance in the long run.

How about we add one more part: The organization name in
the parentheses doesn't necessarily represent the developer's
relationship with that organization, especially when it doesn't
match the email domain name. Maintainers should be cautious
and verify carefully before applying patches.


Thanks,
Yanteng


