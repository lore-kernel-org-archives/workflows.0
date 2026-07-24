Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DAA2F8E9F;
	Fri, 24 Jul 2026 19:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784920551; cv=none; b=Rcyh7QkhUFC5FmB2BBySBHanLjajEF5zxQx9tCkohvtK+JuQsNCNWbA8Bm1TmdmRVmWO6IblacV2jsf3mXN9WdgQUT2zcNUOrq3CgCnydT53hSVyBwGIJ1MaUDD0YAudQ2/wb4lGDMLqIbHSGfV13Ue4gCoF0cO2fyAc6WFKzQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784920551; c=relaxed/simple;
	bh=nFId9gyA7KIrs+CTIMBlOj8PeGZ2P8avR7/NRdOC14s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sN2YVou8Nhd3QMoyPgocNEQdyPV8yzcXbEcTTBdAVSzGbGuFza+BaLhQWEWaAfNSf/tvA6HRqkZotScrtsmKLYyYrikfJ4sYUmQmPBGOKwZwXBcohBlmwQQLBu5tvO0HvGa1qgFVeC6ehZP2XporZ7VpC/Is67MgO127KWG+Uro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbN58gWJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbN58gWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38B71F000E9;
	Fri, 24 Jul 2026 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784920549;
	bh=MfZSY3Q/zzKMDvoG0g5OHtLy83DFVZlVLX7VdBW6WS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hbN58gWJbj2XK624Im4l4Mio0RLjZ0ErhlodWh8t8zeciTah6yPkj/D2zcpwdfZnA
	 3D/nJH0rgOJM1VQBZhptZepk3kmToSjfRn7miumHg1p/x+j47m9AKDGR6W8SSyS++e
	 UhuNfCB9ykjbX18InrlzX5VLDEnuAyLCT22QCptxEd8fASF7utFV17FbvMxOfQf18M
	 geIXIgbeFfZsopGWfvn0MeKJgRcvZ2hhsTKgnsiiy9zDlJ3Tn17Kp94fwtYc4tbFBB
	 FKVIAL6ABJbK3J2fRr2XVGVi07fs8yfzXdOdl7y5f2c9JD8MZ+jeayWosFGu1zTFki
	 BvnhFuCGUiqkA==
Message-ID: <dd18d622-115e-4887-8526-8c6fa766810a@kernel.org>
Date: Fri, 24 Jul 2026 21:15:43 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tech-board] [PATCH] coding-assistants: simplify attribution
To: corbet@lwn.net, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Sasha Levin <sashal@kernel.org>,
 tech-board@groups.linuxfoundation.org, Jakub Kicinski <kuba@kernel.org>,
 workflows@vger.kernel.org
References: <87qzkuahlr.fsf@trenco.lwn.net>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <87qzkuahlr.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 22:34, Jonathan Corbet via groups.linuxfoundation.org wrote:
> As suggested by Christian, I have applied his patch to a branch and
> simplified the changelog, see below.
> 
> I'm nervous about applying it still because I don't think it's my role
> to set this sort of policy; I really want to feel that there is a
> consensus behind it.  So there's some additional CCs here because I
> would like to hear from some folks:
> 
> - This policy document originally came out of the TAB; is the TAB (on
>   CC) OK with this change?
> 
> - At least one maintainer (on CC) have said that they currently strip
>   Assisted-by tags out of patches before applying them, a practice that
>   would seem to undermine the whole policy.  Would this change be
>   sufficient to end that practice?
> 
> Thanks,
> 
> jon
> 
> From c31aa376a355e3b84b9e87ae1dbe19b394d4c82c Mon Sep 17 00:00:00 2001
> From: Christian Brauner <brauner@kernel.org>
> Date: Wed, 1 Jul 2026 17:54:48 +0200
> Subject: [PATCH] coding-assistants: simplify attribution
> 
> The requirement to identify specific models used in the Assisted-by tag
> provides free advertising to proprietary software companies while adding
> little or no useful information.  Change the requirement to simply:
> 
>   Assisted-by: LLM
> 
> to capture the fact that an LLM was used without tracking which one.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Reviewed-by: Jori Koolstra <jkoolstra@xs4all.nl>
> Message-ID: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/process/coding-assistants.rst | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
> index 899f4459c52d..fe34f3e7e828 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -43,12 +43,8 @@ When AI tools contribute to kernel development, proper attribution
>  helps track the evolving role of AI in the development process.
>  Contributions should include an Assisted-by tag in the following format::
>  
> -  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
> +  Assisted-by: LLM [TOOL1] [TOOL2]
>  
> -Where:
> -
> -* ``AGENT_NAME`` is the name of the AI tool or framework
> -* ``MODEL_VERSION`` is the specific model version used
>  * ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
>    (e.g., coccinelle, sparse, smatch, clang-tidy)
>  
> @@ -56,4 +52,4 @@ Basic development tools (git, gcc, make, editors) should not be listed.
>  
>  Example::
>  
> -  Assisted-by: Claude:claude-3-opus coccinelle sparse
> +  Assisted-by: LLM coccinelle sparse

LGTM

Reviewed-by: David Hildenbrand (arm) <david@kernel.org>

-- 
Cheers,

David
