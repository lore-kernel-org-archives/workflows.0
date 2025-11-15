Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F2D20A5C4
	for <workflows@vger.kernel.org>; Sat, 15 Nov 2025 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763220139; cv=none; b=QAL/S6b3bQPrZ9bArzXygVuA+7ywBwOkLuexh/LfXMx/Gz53aXslYJ8G8EmDrOLFLH3xRq9/VusvJdcwSIzL7vNde1AdexqeX5eDyOGEXmPHHEANkE9EAg51VggXdYR0fAjmHFcIltX7Cztjxcc9vmckGz9N6V9UEzjOAC3uveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763220139; c=relaxed/simple;
	bh=IbS3ZgEsVwSJ9+lnuNvu9hIrdNAKhRGKaenwUB3kjF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Umg9sDaNpQdVa1rGCYpwdFIt6/+SMsea9vwSFO9wGjcI960q8L3fchvefYgCDEajNAmlMM1rYSmZfWZP8zn5LhmGhg8s6mD7cjPczOqqHF6lAxQrRjV4T5/UQreTNqA4oQA8cdSRjgDNi5LoYhgBYPbuqsfbq2G5GGQ1M8l0sJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Icf28FtB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NADn7NdD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Icf28FtB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NADn7NdD"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763220136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=592QoA+kCrhFi4GVSfW983g/nitfuygzMxHaYR84+6U=;
	b=Icf28FtBKiKWLPxYVsy0KfH4y8KX9FezQeU+DXNwySBcGYJKKrirfv2e5McnAqAaAXdOfd
	KyGxRkVn1Y9NPZ6exhoqq/oOuBAEVuCNKMJcqIToMRKpQ3xzHYEc44uTs0oYdD2x7koLje
	/jR+SZDjPln7eI0E+XOyp1te7sZ3SplQW3v/aIG+ODlsktj+K3bdrp8lJDrQlKNrRLi/3q
	fLXZRMoMZF/ivRnpbuplrDd+YDJp/dfPmPji5QxezYPIOuZslNE1KcoMxkweEQnAQsuwmv
	Icfm1bWNXuWaRmoWDGNLEbGpioLxiZmx7Ycg7vvNfEwg3ZNB0lVCmomitoXlGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763220136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=592QoA+kCrhFi4GVSfW983g/nitfuygzMxHaYR84+6U=;
	b=NADn7NdDdDG8fdN2jKYmNDABBIePfvd7ClnV/Xs7We7QefpaKpULXTD5dRXv/J9KuEpzcP
	I7zl8iJ3qYp8h9Dg==
To: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
In-Reply-To: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
Date: Sat, 15 Nov 2025 16:22:15 +0100
Message-ID: <87qztz9v88.ffs@tglx>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Nov 14 2025 at 10:35, Dave Hansen wrote:
> +In Scope
> +========
> +
> +These guidelines apply when a meaningful amount of content in a kernel
> +contribution was not written by a person in the Signed-off-by chain,
> +but was instead created by a tool.
> +
> +Detection of a problem and testing the fix for it is also part of the
> +development process; if a tool was used to find a problem addressed by
> +a change, that should be noted in the changelog. This not only gives
> +credit where it is due, it also helps fellow developers find out about
> +these tools.
> +
> +Some examples:
> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
> + - Coccinelle scripts
> + - A chatbot generated a new function in your patch to sort list entries.
> + - A .c file in the patch was originally generated by a coding
> +   assistant but cleaned up by hand.
> + - The changelog was generated by handing the patch to a generative AI
> +   tool and asking it to write the changelog.
> + - The changelog was translated from another language.
> +
> +If in doubt, choose transparency and assume these guidelines apply to
> +your contribution.

Can we pretty please define a tag and format for this?

I'm not really interested in the creative ways which will otherwise make
change logs even more incomprehensible.

Thanks

        tglx
