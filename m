Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234FC1DFD2;
	Fri, 12 Jul 2024 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720807922; cv=none; b=YdaElfX1QO/9alzeAUO5qvzE6yWJU4GPH2y9dPADyt39fWi4t4QKfTYVRHPWM10wYGsQ7XrUn3d9bUF1q7p2TF4fUVgdHhAkmRNu6vz2IMdZe3nvuLx2eYIky6NYyt+tuSLjrIsP8rqEoyW/Fkoqfo4q1m430ImEW3mg8UbICAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720807922; c=relaxed/simple;
	bh=lUavLk1QqNbkhDsolfXZxLlW3avOJgYqwuEkxCmZj7c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVLm4Xh3iqoSF7s6p60TAr60j7mIRMiTI38ZAMFIsgcSJI9eZeRKvs7nRqMxhZJg6psjILLC8iyuNr8FvF105VDWewX+rM48M7yWSNxjOotaOR9F+RMdUM9HPTZ0amtazdsFvqhYOalqIL1wMVsdBLO+lbRwn99Hg6Vv2VJNNL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRR6MviD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRR6MviD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291C4C4AF07;
	Fri, 12 Jul 2024 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720807921;
	bh=lUavLk1QqNbkhDsolfXZxLlW3avOJgYqwuEkxCmZj7c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eRR6MviD29mZz/RL8Z3TJcV2Rzi0jqHm62TsZj2fgA8g8tUSA1AG8JqHnk9JRZdCo
	 ld/FOBFZyhxdFyxzB4JG6yDJtNRF8uir+X2OsoZCQ/BlOzvr0t9lxQlI+R3xWfdEmx
	 3vmHlrXlNcGaY6BYR4gfZpJmF9jiVVe/qIiG4MC5yncN53QdolzsOzY0bKALBOVQ8v
	 4jeiIOZxC3TE5MzK/EE9O+lMSUtB2pp9WDWAyDKrcvkgXIeKMMhfQS2IfLjm8gEzjr
	 Qbd5uC+M1ou5x7Pgwgl/2OXC4hruS6wvIoeOGxUJqSKADGUlDpcM6OhxKgT247QSC+
	 R0XaCi5Xe6b2Q==
Date: Fri, 12 Jul 2024 20:11:56 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240712201156.1413e80e@foz.lan>
In-Reply-To: <1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
References: <20240712144903.392284-1-kuba@kernel.org>
	<7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
	<1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 12 Jul 2024 09:42:07 -0600
Shuah Khan <skhan@linuxfoundation.org> escreveu:

> On 7/12/24 09:25, Mark Brown wrote:
> > On Fri, Jul 12, 2024 at 07:49:03AM -0700, Jakub Kicinski wrote:
> >   
> >> +Open development
> >> +----------------
> >> +
> >> +Discussions about user reported issues, and development of new code
> >> +should be conducted in a manner typical for the larger subsystem.
> >> +It is common for development within a single company to be conducted
> >> +behind closed doors.

True. So what?

> >> However, maintainers must not redirect discussions
> >> +and development related to the upstream code from the upstream mailing lists
> >> +to closed forums or private conversations. Reasonable exceptions to this
> >> +guidance include discussions about security related issues.  

Not sure what this somewhat obscure message wants to accomplish.

It is quite common to have developers and maintainers discussing 
outside public forums and internally at the companies they're working 
for. There are lots of reasonable exceptions besides security. On my
years of experience, the reasons I've seen more often are:

1. language and/or cultural barriers;
2. teaching and mentoring new developers to start contributing upstream;
3. need to have internal discussions in the light of some IP protected
   material.

(1) and (2) are very common for non-native English speakers
and for newbies, and we do want to have more contributions from
them. (3) is unavoidable, as discussions related to protected
IP can't be disclosed due to legal reasons.

Also, if you take it to the letter, have discussions on LPC, 
summits BoFs, other events handled by the open source community 
and wall conversations are "closed forums/private conversations".
I've seen a lot of good results produced on such private
conversations that solved relevant conflicts and got
materialized as great contributions.

There's nothing wrong with that, provided that the outcoming of
such internal discussions are reflected publicly as patches,
summit minutes, LWN articles, etc.

The only issues I see with such talks is that the work when
co-authored should be properly marked as such and that 
reviewews/acks taken behind doors don't have the same meaning
as an upstream review, as they may be due to some internal 
formalities.

IMO, the best would instead to give a positive message. E. g.
something like:

	Maintainers must encourage discussions and reviews to happen
	at public mailing lists, avoiding whenever possible to have
	internal discussions.

Regards,
Mauro
