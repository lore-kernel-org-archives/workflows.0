Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7625B0A7
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966958; cv=none; b=IyBfHniHs7Uk79J7aNehxgEKyhmGrt6AM0YXpnaRJIhzCpLFUSGMQL8RhSPM2b2dnuYDDDm8V0c6DsbvooumJgaKaA3bPboy/K4lBbg7fzF211U4M70f+waRv0gBznzq2yiVOypAMHUstC/BYOCcpjp4lX5sV7K3mxqKa4MB/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966958; c=relaxed/simple;
	bh=3rSsiKaBSmgTJxNbOdGGtCJNlduSQH716D1SGg2tios=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2gqBC9NdvyX2t72UGk339weXk0AYy3lXveh0vGQACxgtYvzasHtC6srRzLLZFKkO7jTIhnPqbD/onGOkAXiVjkcyUH3PPxuL05RNfJiAaKLfkDIwq2AnhQQL/pIttF7DsveXivYqbxE7jWuQjRdZ6WZ1Y79LBGyFHvZYC6vV3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BKJbJVTj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BKJbJVTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778966955;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=qXPmlQvqHBxMmQNnbh3VZzf7jLpmsQnEx3JAK1wgAb4=;
	b=BKJbJVTje1QSlBARbLK++qsy8FcLW+CnM9DlJps19wzUCNDBQphjFznmM7fO29s1AMGQtA
	a+oTTXWqamPWHjInMQ4XQ0CGIujI8YHtbhT8vInihb1YtvuV3pM0Nbhnt55VDuR9WFLUCp
	/vFAGTanQDrwtqcihgMPYiO+5K3POCw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-5IoSBBPeMJy4tuwqKDXyRQ-1; Sat,
 16 May 2026 17:29:13 -0400
X-MC-Unique: 5IoSBBPeMJy4tuwqKDXyRQ-1
X-Mimecast-MFC-AGG-ID: 5IoSBBPeMJy4tuwqKDXyRQ_1778966951
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7C5D1956050;
	Sat, 16 May 2026 21:29:10 +0000 (UTC)
Received: from localhost (unknown [10.22.88.28])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF1C119432BB;
	Sat, 16 May 2026 21:29:09 +0000 (UTC)
Date: Sat, 16 May 2026 17:29:09 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, 
	Greg KH <gregkh@linuxfoundation.org>, Konstantin Ryabitsev <mricon@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, 
	Linux Kernel Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	devicetree@vger.kernel.org, kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <agjb7-q-p2SemgJa@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <2026051631-trolling-juggling-da1c@gregkh>
 <0902F8E6-C495-40A1-975D-92D3B72D44AE@linux.dev>
 <agi3X76XwcBJ-KmH@x1>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agi3X76XwcBJ-KmH@x1>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Sat, May 16, 2026 at 03:28:47PM -0300, Arnaldo Carvalho de Melo wrote:
> 
> Couldn't this be something like:
> 
> AI-analysed-by: bot-X

+1

78d979db6cef5 ("docs: add AI Coding Assistants documentation") introduced the
coding-assistants document some time ago [0]. In that time span, we've
seen a quick rise in popularity for tools that leverage reviews through the use
of LLMs.

And while the document does call out general AI contributions with:

> Contributions should include an Assisted-by tag in the following format:

expanding it to include something like "AI-analyzed-by" would be nice.

> So, yeah, Reviewed-by is definetly for definetly persons, but having
> some tag that states that it went thru automated reviewing^Wanalysis by
> a definetly bot/thing/whatever that some people think is useful seems
> useful.

Agreed. I think there is a distinction (although a pedantic one) between a
Generated-by/Assisted-by and something like "AI-analyzed" :-)


[0] https://lore.kernel.org/lkml/20251223122110.2496946-1-sashal@kernel.org/

-- 
Derek <debarbos@redhat.com>

