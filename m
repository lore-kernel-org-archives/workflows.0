Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929437C914;
	Mon, 11 May 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532137; cv=none; b=U+bbVTX140cTUyjdY1gZJKHOrw+Fe/0iDDVwWFiQr3c4pa58zzQ9nPixD9Obge6ud+NpMsQ0MjJXxkGlLKpGjGFDujn0bb7Vy9FniD/OCds76UnbU5+FYDXHuD+JgAMObs8OraEx3oeIaISJWLOgHj5gQmG3ARIjXL0bRygkvPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532137; c=relaxed/simple;
	bh=TNek+Vy0SPPGQeL6lJycHd2bHVq/8XtZApMP43e3w8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vum/rHYZtjmqxGUg8itayjY9abpx848tBIokroBL3YlAiVXDHEwsnSynTFxGWo0jFSsn/MfaYQScssxFrHoNIKwX/v7cxDRJ4geJvpanbWBEixkeaJdWUdo2aoG0CxmP4Kn4IaWcT0HS0Nm17ynVMREhhXp+ClB+X8AlaPXr8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hCqSjoUF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hCqSjoUF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D76DB40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778532135; bh=bjEirsDdfpedPl8hqqxa10zJ87UyMtd7EoLdj/YUP4U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hCqSjoUFOIzzBlQA+3wvrK0IG9bIDeBfvLu71QL5vtNtNAmKOkDMdLM0QdgsrPw4z
	 7/m7RUBRbwzshHZpmO+K2vb6npoCstc6kHmLO/n6hdppkhzQJpFbVAzxVz6v+5lfYo
	 opOnF40UygM7z/cL0Px9XzjG/Q9nafK6J31CzlKqMQxPgGiBx2JCKpuSvAbo+k2Q7q
	 aLi6ZlLQTgdXNc6J60V7pkna6tl9AaQaIMyzTbtZC/Ri5lFlc0ezgQQkCB25774ShQ
	 1nTlxhxjD1S0Jz0KNBNuiEj2gPXk7F+9IJ6SXp433zhd/3lRJAKzm8Guw2Wswel4k4
	 oo61+A7crwWqQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D76DB40C7C;
	Mon, 11 May 2026 20:42:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
 skhan@linuxfoundation.org, security@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
In-Reply-To: <agI7XogSmfN_Pm4t@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu> <2026051124-afar-renewal-795c@gregkh>
 <agIZ8zeg3m0xE3yL@1wt.eu> <878q9pvlif.fsf@trenco.lwn.net>
 <agI7XogSmfN_Pm4t@1wt.eu>
Date: Mon, 11 May 2026 14:42:14 -0600
Message-ID: <87a4u5u195.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

>> I can ship stuff Linusward quickly too... :)  But it's fine if Greg
>> takes it, of course.
>
> Oh that's fine then. I thought you only delivered such updates into next
> releases. I'm fine with either way of course! Let's pick the path of
> least effort for each.

That's my normal procedure, since there are few docs changes that have
greater urgency, but I do have a "fixes" branch.

Greg, what's your preference?  Unless I hear otherwise, I guess I'll
apply it shortly.

Thanks,

jon
