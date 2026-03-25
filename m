Received: from mail.cock.li (mail.cock.li [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765C22576E;
	Wed, 25 Mar 2026 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445488; cv=none; b=RpXTP7rjss6afuwjcbviTTQYRwykdqoKoC4+usq6JbQ1SzaBIjKHWdFZIP3oC0gZXpRzWcOj5dB0dsomei8+x2rZ45QgX2YXOYxX0kHH81b8EjTlDJ+juBGVrjrLJA9QllLx2T6JhrSSYOANXFrsd1ZKotjfc+uWmHRb+XZcvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445488; c=relaxed/simple;
	bh=q3tuWp1RLUYTJrvvPpp6oNTO7zyjhWAmE56QxTrEU0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r7nZE/hULAXr80T5T0qG5xYv1c5qVBzS1EosVb6YBCyMYYbJIrAR0OgZPiqvqgB1JuaGM6pGV1FupoMMNen0Az8c0+exIoNg/mMt9/ep4SU9go0iGwreM4TZqyXGFjkP3FoRX4rlardyzavfaEPgLQhVbO3fsX7G+V5y6Fk2xy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=sVnOChlq; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="sVnOChlq"
Message-ID: <ce9e75d81c6bd67cb2ff92bfd63f9dea0e7980e8.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1774445477; bh=q3tuWp1RLUYTJrvvPpp6oNTO7zyjhWAmE56QxTrEU0E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=sVnOChlqcqEm/oeUDO1JzdJw0W1WOl1DIRaNy0dj2SlZ4VLGnDq/PlplqciN7BZcO
	 JP+RL/t9vqng2PCQig1P6MEbFbwRPS9khnlqq14RVp3I5Qb1P02utQc/IVvJZMBnpv
	 aQJE3lO87LM/3qpA6imy2jtgusV/7v/r6SLQuqwPTPyxQSmCg1bsko1jf71kuIDKkW
	 iJwdopd+Ef1NJ5x9zzWIlRcB4vxIJS6QbVZhpfDqJZcq/FbM7QMQdI5D7218kn/kF3
	 8YFtfNUm10ULDgKARzcu+YyQ73mrDSAfQmGdOEd1pf/Intpct24XOXYsWXiRP2aR4o
	 G45nwhXj5B94w==
Subject: Re: [PATCH v4 0/4] workflow, scripts: sort changes.rst and ver_linux
From: Manuel Ebner <manuelebner@airmail.cc>
To: Jonathan Corbet <corbet@lwn.net>, Collin Funk <collin.funk1@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 25 Mar 2026 14:30:54 +0100
In-Reply-To: <87zf46biix.fsf@trenco.lwn.net>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
	 <87zf46biix.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43app1) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-03-17 at 09:08 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@airmail.cc> writes:
>=20
> > ...
> Also, overall, I am still not thrilled about you having send me patches
> under a false name.=C2=A0 I need you to, at a bare minimum, acknowledge t=
hat
> this was a violation of the trust that the kernel project depends on,
> and that the current name you are using is the real one.
>=20
> Thanks,
>=20
> jon

Hello Jon,
unfortunately I have an issue with my e-mail provider. Because of an spamho=
use.org
entry my mails do not show up in the mailing lists.
Do you mind me changing my e-mail address to manuelebner@mailbox.org

Manuel
