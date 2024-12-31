Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE95227
	for <workflows@vger.kernel.org>; Tue, 31 Dec 2024 01:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735607262; cv=none; b=G7rfVXSmfofdDrzZ8OO8Nw8C74gf9S0QClLuXwPy2ivqQPzGN5iRT/Uu8ACXHUDatH08FsdWdap7rPoIArTgrPBXlZnzGwSrGpWz93FmIvy3wqm3GcH9kPpNroSz7hkJVdaKSaBxsMS58hTQ0PZ+/uO3P9jfBlbNzp+YpDplSHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735607262; c=relaxed/simple;
	bh=KX0E+g+P5KAViNFdHEGauM6GcAYWF9VHstWQ8ZM+VWg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rFjLvKtCOmMIKSkIe7XURnrtcCZYPZf/4nyxoyt6awYgN3z8sYaHRuOmPw8xJYHB/P+DZg5GjO1+j2EG1mCMXijQmOvhZVMlPDMLs2fpjELyUyu/HIv050MYlmfWZk5eHjtbCXAYdbvRCvOfL9bpk7GXXTam4cCOY0V2S+aZwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLoFFZ9u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLoFFZ9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D67C4CED0;
	Tue, 31 Dec 2024 01:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607262;
	bh=KX0E+g+P5KAViNFdHEGauM6GcAYWF9VHstWQ8ZM+VWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tLoFFZ9uV7T0hjKie82dcQpZPwL+b1zLbahYNqH3o7jEePqLsZ+uf3T2TL14Ia2Bf
	 aOc6NUarNbAPzUoeeqYCRecC4WlcpKubGW63VKP5UGr3VSrxvXgDTZ9uggkrjKsw8R
	 qJwBBJVSPLZqHbrCUigy6JT04G1O63SkdBUGJkecdnWmTTolqBY4anhvJfBuV91JMm
	 6cyf0GpVj9JNX1EhVES4ciEfa3FQz3i/DKB8Br6Ogq25Ngq6wcT6HjhiihU3qmZU1Z
	 Sh26vRHvIFWAc/yI3Vt30YoZKwTwo39A6lBvZv5l+Gwj/btbKXrgEkTXcxhTj0DiDT
	 1hMYiIUFO/Rqg==
Date: Mon, 30 Dec 2024 17:07:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, workflows@vger.kernel.org, choypoy@linuxfoundation.org
Subject: Re: Putting my maintainer support hat on
Message-ID: <20241230170740.64f6e5e1@kernel.org>
In-Reply-To: <20241230-loyal-jumping-marmoset-0bde8f@lemur>
References: <20241230-loyal-jumping-marmoset-0bde8f@lemur>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Dec 2024 17:01:16 -0500 Konstantin Ryabitsev wrote:
> I'd like to semi-formally announce that everything is finally in place for me
> to take a more official "Linux maintainer support" role at the Linux
> Foundation. I know we've talked about it multiple times before and I brought
> it up at several maintainer summits, but it took a while to officially mold it
> into something tangible. I would like to thank the Linux Foundation TAB for
> making this possible.

Excellent news! Looking forward to all the cool work :)

> Plus whatever feedback I get from maintainers -- my goal is to work on things
> that bug you most, not what I think is cool. :)

AFAICT your definition of "cool" includes "useful" so we're in safe
hands either way, but since you mentioned feedback.. Perhaps one of 
the first steps would be setting up some system where people can post
and upvote pain points / problems to solve? I think Jim Z suggested /
agreed to open up LF's Jira to use for this sort of tracking (simpler
and more open systems likely exist, but no preference).
