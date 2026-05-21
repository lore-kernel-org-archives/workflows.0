Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5603321AA;
	Thu, 21 May 2026 05:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340358; cv=none; b=UXL28Y1mIBx5RzgdEj8bJxEIEvKF93KK7sIZWT7vlZB3Tul1sZz0sKmuOfaubsxq0QSB2GROZl69I5jYOzZJD6SH7vnnKKJYOnjoNJGIhfJpdTBgRsA3bf8tsnviHpRnyj/370dcWWIXsHCBu1baUnh6icdEVpgEu5VSkQlGvkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340358; c=relaxed/simple;
	bh=Qoihp5XlJv0PjYW+cAbR48Mszt6rPNDiFaZQuX+5hnw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JkK+ognVUi6g5nEk+MijBzXvH5NcuqYxXJ7QfEZw90UyxeqpclSVTw9cu3OwdQpj9brvVd245bA0kw+lcKOX9LJjuXUorcIcQWBOOS69YhDAUXn1bAbxT+DzNneVoID4TjTAi1mE3Euwp5q24WdyAXmnBGqYoBex0nuUQYwLsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnpaXrz6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnpaXrz6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7BB1F000E9;
	Thu, 21 May 2026 05:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779340356;
	bh=wwKjoYSXmX8I7cHHAgcRYdvfu+2Ea/zHIjgAs/Hu0Vk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GnpaXrz6UPCnCEguQlx1twV+Qc63VsI6Jf8DCP4KVK5Lt+iiXTLHmWwNCFTLztgQQ
	 eOujty+RBBDwZ2ExSyYWHvDd8U96yE5DP3tD4B3FtWJWwVzTHrSngwC35n6kreRBue
	 pkjE6onGWMv5Jvo5nPxanJrihWp78kixo+04oX9GxgVqeiYBQCXO3IhRxDAbHAD50a
	 vEVeWO1nHlyptBqj49H/JFdDEV9ZcYut+sTHVNPncyBB5zJN3ZHG2g7F3mbhDFJ3SH
	 I8JYqH4kGe2JM0jJOqoRj3aHeOoWp1IiovHvknEj7us4QjsRdYwrRFQTS/WIwNWXTL
	 432YHOqwqlq9A==
Date: Thu, 21 May 2026 07:12:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Vlastimil Babka <vbabka@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify that "reviewer" is
 a person
Message-ID: <20260521071230.0e4e3d1d@foz.lan>
In-Reply-To: <20260520154846.162170-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260520154846.162170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 May 2026 17:48:47 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Common understanding of word "Reviewer" is: a person performing a review
> work [1]. Tools are not persons, thus cannot be reviewers in this term.
> Also tools cannot make statements and cannot take responsibility for the
> review.
> 
> Our docs already clearly mark that "Reviewed-by" must come from a
> person:
> 
>  - "By offering my Reviewed-by: tag, I state that:"
> 
>    Usage of first person "I" and word "state"
> 
>  - "A Reviewed-by tag is *a statement of opinion* that the patch is an
>     appropriate modification of the kernel without any remaining serious"
> 
>    Only a person can make a statement of opinion.
> 
>  - "Any interested reviewer (who has done the work) can offer a
>    Reviewed-by"
> 
>    A person can offer a tag thus above does not grant the tool
>    permission to offer a tag.
> 
> However this might not be enough, so let's clarify that only a person
> with a known identity can state the "Reviewer's statement of oversight".
> 
> Link: https://en.wiktionary.org/wiki/reviewer [1]
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Makes sense to me.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> 
> Changes in v2:
> 1. Add tags
> 2. Rephrase/simplify a bit commit msg. Rephrase title - drop "in
>    English".
> 3. Add "with known identity", suggested by David Hildenbrand. I retained
>    previous tags, assuming this change is within spirit of previous
>    version and there were no objections on the list.
> ---
>  Documentation/process/submitting-patches.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index d7290e208e72..cc6a1f73d7f2 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -581,12 +581,12 @@ By offering my Reviewed-by: tag, I state that:
>  
>  A Reviewed-by tag is a statement of opinion that the patch is an
>  appropriate modification of the kernel without any remaining serious
> -technical issues.  Any interested reviewer (who has done the work) can
> -offer a Reviewed-by tag for a patch.  This tag serves to give credit to
> -reviewers and to inform maintainers of the degree of review which has been
> -done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
> -understand the subject area and to perform thorough reviews, will normally
> -increase the likelihood of your patch getting into the kernel.
> +technical issues.  Any interested reviewer (who has done the work and is a
> +person with known identity) can offer a Reviewed-by tag for a patch.  This tag
> +serves to give credit to reviewers and to inform maintainers of the degree of
> +review which has been done on the patch.  Reviewed-by: tags, when supplied by
> +reviewers known to understand the subject area and to perform thorough reviews,
> +will normally increase the likelihood of your patch getting into the kernel.
>  
>  Both Tested-by and Reviewed-by tags, once received on mailing list from tester
>  or reviewer, should be added by author to the applicable patches when sending



Thanks,
Mauro
