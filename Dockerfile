FROM p3ps1man/dockertrader
COPY supervisord.conf /home/mt5/.supervisor/supervisord.conf
CMD ["supervisord", "-n", "-c", "/home/mt5/.supervisor/supervisord.conf"]